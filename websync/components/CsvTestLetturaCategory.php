<?php namespace Tecnotrade\Websync\Components;


use Artisan;
use Illuminate\Support\Facades\Http;
use Cms\Classes\ComponentBase;
use Tecnotrade\Websync\Models\ClientProductRules as ClientProductRules;
use Tecnotrade\Websync\Models\ClientProductFields as ClientProductFields;
use Tecnotrade\Websync\Models\TableProductFields as SincroProductFields;
use Tecnotrade\Websync\Models\ClientCategoryRules as ClientCategoryRules;

use Tecnotrade\Websync\Models\ClientCategoryFields as ClientCategoryFields;
use Tecnotrade\Websync\Models\TableCategoryFields as SincroCategoryFields;

use Tecnotrade\Websync\Models\ConfigSetting As SyncSetting;
use Tecnotrade\Websync\Models\SupportProductTable as ProductTable;
use Tecnotrade\Websync\Models\SupportCategoryTable as CategoryTable;
use October\Rain\Exception\ApplicationException as AppException;
use Tecnotrade\TecnotradeWebsyncCategorySetting\Models\ConfigSetting as CatConfigSetting;
use Tecnotrade\Websync\Classes\CommonConfigFunctions as CommonConfigFunction;
use Exception;
use League\Csv\Reader;
use League\Csv\Statement;

use Carbon\Carbon;




class CsvTestLetturaCategory extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Test Lettura Dati Categorie Dinamica Con Csv',
            'description' => 'Dynamic Category Test Binding With Csv'
        ];
    }

    public $websyncCategoryConfiguration;
    public $websyncConfiguration=array();
    public $rulesToBind=array();
    public $csvConfiguration=array();
    public $tipoClientData;
    protected $numRecordCorretti;
    protected $numRecordSaltati;
    protected $numRecordErrati;
    protected $codiciRecordErrati=[];
    


    public function defineProperties(){
        return [];
    }
    public function onRun(){
        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        if($this->tipoClientData=="CSV"){
            $this->websyncCategoryConfiguration=CommonConfigFunction::getCsvConfiguration('CATEGORIE');
            $this->setDataForCsv();
            $hasPk=$this->checkPrimaryKeyExists();
            if($hasPk===false){
                throw new AppException('Categorie: Non hai specificato la chiave primaria, o non l\'hai associata al campo corretto.');
            }
            $this->prepareSincroCategories();
            $result=$this->creaAlberoCategorie(0);
            
            if($result){
                CategoryTable::query()->update(['import_status' => 1]);
               
            }
            else{
                throw new AppException('Si  è verificato un problema nella creazione dell\' albero delle Categorie.');  
            }
        }
    }

    protected function checkPrimaryKeyExists(){
        $elements=$this->rulesToBind;
        foreach($elements as $element){
            if($element["mallField"]=="code"){
               
                $pk=$element["pk"];
                if( ($pk && $pk=="1") ){
                    return true;
                }
                else{
                    return false;
                }
            }
        }
        return false;
    }



    public function setDataForCsv(){
        $res=$this->prepareCsvCategoriesRules();
        if($res!==true){
            throw new AppException('Si  è verificato un problema nella creazione delle regole delle Categorie.');  
        }
        
    }


    public function prepareCsvCategoriesRules() {
       
        
        $allCategoriesFields=SincroCategoryFields::all();
        //dd($allCategoriesFields);
        if($allCategoriesFields && count($allCategoriesFields)>0){
            foreach($allCategoriesFields as $pField){
                if(!$pField->clientcategoryrules){
                    continue;
                }
                $ruleRelation=$pField->clientcategoryrules;
                
                //dd($ruleRelation);
                $fieldTypeMaxLength=$pField->fieldtype->max_length;
                $mallField=$pField->field_name;            
                if(!$ruleRelation->clientcategoryfields){
                    continue;
                }
                $clientFields=$ruleRelation->clientcategoryfields;   
                                 
                //dd($clientFields);
                $ruleFields=[];
                foreach($clientFields as $clField){
                    
                    $fName=$clField->field_name;
                    $fPosition=$clField->order;
                    $fIsNumeric=empty($clField->fieldtype->is_numeric) ? 0: $clField->fieldtype->is_numeric;
                    
                    $ruleFields[]=[
                        "nomeCampo"=>$fName,
                        "posizioneCampo"=>$fPosition,
                        "isNumeric"=>$fIsNumeric,

                    ];
                    
                }
                $regole=[
                    "nomeRegola"=>$ruleRelation->rule_name,
                    "idRegola"=>$ruleRelation->id,
                    "pk"=>$ruleRelation->is_primary_key,
                    "sommaCampiNumerici"=>null,
                    "concatenaStringhe"=>null,
                    "eliminaSeIniziaPer"=>empty(trim($ruleRelation->elimina_da_mall_se_inizia_per))? null :$ruleRelation->elimina_da_mall_se_inizia_per ,
                    "eliminaSeUguale_a"=>empty(trim($ruleRelation->elimina_da_mall_se_uguale_a))?null : $ruleRelation->elimina_da_mall_se_uguale_a, 
                    "isSlug"=>$ruleRelation->is_slug,
                    "isRelationWithProductTable"=>empty($pField->is_relation_with_product_table) ? null:true,
                    "isPrimaryKey"=>$pField->is_primary_key===0 ? null:true,
                    "isDateToCompare"=>$ruleRelation->is_data_update,
                    "maxLength"=>$fieldTypeMaxLength,
                    "fields"=>$ruleFields,
                    "mallField"=>$mallField,
                    
                ];
                
                
                $this->rulesToBind[]=$regole;

              
                
            }
            $this->numRecordCorretti=0;
            $this->numRecordSaltati=0;
            $this->numRecordErrati=0;
            return true;
            
        }
        else{

            throw new AppException('Non hai effettuato il binding corretto con la tabella prodotti');
        }
    }
    protected function prepareSincroCategories(){
        $conf=$this->websyncCategoryConfiguration;
       
        $type=$conf["type"];
        $usePagination=true;
        $recordPerPage=100;
        $currentPage=1;
        $useDataForUpdate=null;
        $dataParamNameFormat=null;
        
        if($conf["updateFieldName"] && !empty($conf["updateFieldName"])){
            $useDataForUpdate=true;
            $dataParamNameFormat=$conf["updateDateFormat"];
        }
        if($type=="CSV"){
                           
            $this->getCategories($conf,$recordPerPage,$currentPage,$useDataForUpdate,$dataParamNameFormat,0);
            
            
        }
    }
    protected function getClientApiPrimaryKey(){
        $elements=$this->rulesToBind;
        $nomeChiave='';
        foreach($elements as $element){
            if($element["mallField"]=="code"){
               
                foreach($element["fields"] as $field){
                    $nomeChiave=$field["nomeCampo"];
                    return $nomeChiave;
                }
            }
        }
    }

    


    protected function getCategories($configData,$recordPerPage=null,$page=1,$useDataForUpdate=null,$dataParamNameFormat=null,$numRowToread=null){
        /*
         "type"=>"API",
                "updateFieldName"=>$postParamDataUpdateName,
                "updateDateFormat"=>$postParamDataUpdateFormat,
                "productFileName"=>$productFileName,
                "categoryFileName"=>$categoryFileName,
                "brandFileName"=>$brandFileName,
                "fieldsSeparator"=>$fieldSeparator,
                "hasHeader"=>$postHasHeader,
                "useFieldNumber"=>$useFieldNumber,
                "useFtp"=>$useFtp,
                "categorySettings"=>$categoryConfig,
        */
        
        $dataDiModifica = null;
        $categoriesFileName=$configData["categoryFileName"];
        $hasHeader = $configData["hasHeader"];
        $fieldSeparator=$configData["fieldsSeparator"];
        

        $articoliParamNumPerPageName=null;
        $articolParamPageToReadName=null;
        $articoliParamDataUpdateName=null;
        // nome del campo che contine la chiave primaria del prodotto nelle api
        $pKey=$this->getClientApiPrimaryKey();
        
        $pageToread=$page;
        $numPerPage=$recordPerPage;    
        
        $articoliParamDataUpdateName=$configData["updateFieldName"];
        $dataDiModifica=Carbon::now()->subDays(5)->format($dataParamNameFormat);        
        
        
        
        $filePath = storage_path('app/media/'.$categoriesFileName);
        $csv = Reader::createFromPath($filePath, 'r');
        $csv->setDelimiter($fieldSeparator);
        if($hasHeader===true){
            $csv->setHeaderOffset(0);
        }
        $chunkSize = $numPerPage; // Numero di righe da leggere in ogni chunk
        $totalRows = $csv->count();
        $startingRecord=$chunkSize*$pageToread;
        $statement = (new Statement())
        ->offset($startingRecord)
        ->limit($chunkSize);
        $chunkRecords = $statement->process($csv);
        $totalRecords=$numRowToread;
        if ($totalRows === $totalRecords) {
            // Invia una risposta indicando che non ci sono più righe da leggere
            return $totalRecords;
        }
        else{
            foreach ($chunkRecords as $record){
                
                $valuePrimaryKey=$record[$pKey];
                $valueDate=$record[$articoliParamDataUpdateName];
                //$date2 = Carbon::createFromFormat($dataParamNameFormat, $valueDate);
                /*if($valueDate > $dataDiModifica){
                    $this->numRecordSaltati++;
                    $totalRecords++;
                    continue;
                }*/
                $result=$this->addToCategorySupportTable($record,$pKey,$valuePrimaryKey);
                dd($valuePrimaryKey);
                if($result=="1"){
                    $this->numRecordCorretti++;
                }
                else{
                    $this->numRecordErrati++;
                    $this->codiciRecordErrati[]=$valuePrimaryKey;
                }
                $totalRecords++;
            } 
            $nextPage=$page + 1;
            return $this->getCategories($configData,$recordPerPage,$nextPage,$useDataForUpdate,$dataParamNameFormat,$totalRecords);    
        }
    }
    protected function addToCategorySupportTable($categoria,$pKeyClient,$pKeyClientvalue){
        
        $rules=$this->rulesToBind;
        $categorySettings=$this->websyncCategoryConfiguration["categorySettings"];
       
        $alberoIsOne=null;
        
        $tipoAlbero=$categorySettings["treeMethod"];
        if($tipoAlbero==="ONE"){
            // se l'albero è one sono tutte categorie di root questa regola sovrascrive tutte le altre
            $alberoIsOne=true;
        }
        $chiavePrimariaApiClient=$this->getClientApiPrimaryKey();
        $stringToTest='';
        $action="NEW";
       
        $categoriaAppoggio=CategoryTable::where('code','=',$pKeyClientvalue)->first();
        if($categoriaAppoggio){
            $action="UPD";
        }
        else{
            $categoriaAppoggio=new CategoryTable();
        }
        
        
        $nascondiCategoria=null;
       
        foreach($rules as $rule){
            
            $ruleName=$rule["nomeRegola"];
            $pk=$rule["pk"];
            $isPrimaryKey=$rule["isPrimaryKey"];
            $categoryField=$rule["mallField"];
            $valueToSave=0;
            $fieldNames='';
            $fieldNumeric=0;
            $valueAssigned=false;
           

            // AGGREGO I CAMPI DELLE API
            foreach($rule["fields"] as $field){
                $fieldNames.=trim($field["nomeCampo"]).',';
                $fieldNumeric=$field["isNumeric"];
            }
            // TOLGO LA VIRGOLA FINALE
            $clientFields=substr($fieldNames, 0, -1);
            
            // CONTROLLO SE UNA REGOLA DI ELIMINAZIONE
            if($rule["eliminaSeIniziaPer"] && !empty($rule["eliminaSeIniziaPer"])){
                $valueEliminaSeIniziaPer=$rule["eliminaSeIniziaPer"];
                $arrFieldsToTake=explode(",",$clientFields);
                foreach($arrFieldsToTake as $f){
                    $val=$categoria[$f];
                    if (substr($val, 0, strlen($valueEliminaSeIniziaPer)) === $valueEliminaSeIniziaPer){
                       $nascondiCategoria=true;
                    } 
                }
            }
            if($rule["eliminaSeUguale_a"] && !empty($rule["eliminaSeUguale_a"])){
                $valueEliminaSeUgualeA=$rule["eliminaSeUguale_a"];
                $arrFieldsToTake=explode(",",$clientFields);
                foreach($arrFieldsToTake as $f){
                    $val=$categoria[$f];
                    if (substr($val, 0, strlen($valueEliminaSeUgualeA)) === $valueEliminaSeUgualeA){
                        $nascondiCategoria=true;
                    } 
                }
            }
            if($action==="UPD"){
                if($pk=="1" || $isPrimaryKey=="1" || $categoryField=='code' || $categoryField=='slug'){
                    
                    continue;
                }
            }
           
            
            // controllo se devo sommare i campi come numeri
            
            if($rule["sommaCampiNumerici"] && count($rule["fields"]) >0 ){
                $valueToSave=0;
                $arrFieldsToTake=explode(",",$clientFields);
                foreach($arrFieldsToTake as $f){
                    $val=$categoria[$f];
                    $valueToSave+=$val;
                }
                $categoriaAppoggio->{$categoryField}=$valueToSave;
                $valueAssigned=true;           
            }

            

            // SE NON HO ASSEGNATO IL VALORE PER AGGREGAZIONE NUMERICA CONTROLLO SE ASSEGNO PER CONCAT STRING

            if($rule["concatenaStringhe"] && count($rule["fields"]) >0 && $valueAssigned===false){
                $valueToSave='';
                $arrFieldsToTake=explode(",",$clientFields);
                    foreach($arrFieldsToTake as $f){
                        $val=$categoryField[$f];
                        $valueToSave.=' '.$val;

                    }
                $categoriaAppoggio->{$categoryField}=$valueToSave;
                $valueAssigned=true;    
            }

            // // SE NON CI SONO REGOLE DI AGGREGAZIONE ASSEGNO IL VALORE NON HO ASSEGNATO IL VALORE PER QUESTA REGOLA
            if($valueAssigned==false){
                foreach($rule["fields"] as $field){
                   
                    $fieldName=trim($field["nomeCampo"]);
                    
                    $val=$categoria[$fieldName];
                    $valueToSave=$val;
                    $categoriaAppoggio->{$categoryField}=$val;
                    $valueAssigned=true;
                    break;
                }
            }
            
            
        }
        
        if($nascondiCategoria){
            $categoriaAppoggio->visibility=0;
        }
        if(empty($categoria->visibility)){
            $categoriaAppoggio->visibility=1;
        }
        
        if($alberoIsOne===true){
            $categoriaAppoggio->parent_code=null;
            $categoriaAppoggio->level=0;
        }


        $categoriaAppoggio->import_status=1;
       
            
        try{
            $xId=$categoriaAppoggio->save();
            dd($xId);
            return 1;   
            
        }
        catch(Exception $ex){
            $errore=$ex->getMessage();
            throw new AppException($errore);
            return 0;
        }
        
    }  
    protected function creaAlberoCategorie($level){
        $categorySettings=$this->websyncCategoryConfiguration["categorySettings"];
        $tipoAlbero=$categorySettings["treeMethod"];
        $newLevel=0;
        //controllo Se tutte le categorie sono in import_status 2
        // se sono in import_status 2 esco dalla funzione
        // uso import status = 1 , il count deve essere 0
        $numCategorieAppoggio=CategoryTable::where('import_status','=',1)->count();
        if($numCategorieAppoggio === 0 ){
            return true;
        }



        if($tipoAlbero==="REC"){
            if($level=="0"){
                $categorieAppoggio = CategoryTable::whereNull('parent_code')
                ->orWhere('parent_code', '=', '')
                ->where('import_status','=',1)
                ->get();
                
                $newLevel=$level+1;
               
                foreach($categorieAppoggio as $cat){
                    $codiceCategoria=$cat->code;
                    $childCategories=CategoryTable::where('parent_code','=',$codiceCategoria)
                    ->where('import_status','=',1)
                    ->get();
                    foreach($childCategories as $child){
                        $child->level=$newLevel;
                        $child->save();
                    }
                    $cat->import_status=2;
                    $cat->save();
                }
                $this->creaAlberoCategorie($newLevel);
            }
            else{
                
                $categorieAppoggio = CategoryTable::where('level','=',$level)
                ->get();
                
                

                foreach($categorieAppoggio as $cat){
                    
                    
                    $codiceCategoria=$cat->code;
                    $childCategories=CategoryTable::where('parent_code','=',$codiceCategoria)->get();
                   
                    foreach($childCategories as $child){
                        
                        $child->level=$level+1;
                        $child->import_status=2;
                        $child->save();
                        
                    }
                    $cat->import_status=2;
                    $cat->save();
                }
                $newLevel=$level+1;
                $this->creaAlberoCategorie($newLevel);  
            }
            $numCategorieAppoggio=CategoryTable::where('import_status','=',1)->count();
            if($numCategorieAppoggio === 0 ){
            return true;
        }  
           
        }
    }
}

/*
$categorySettings=$this->websyncCategoryConfiguration["categorySettings"];
                $tipoAlbero=$categorySettings["treeMethod"];
                if($tipoAlbero==="ONE" || $tipoAlbero==="DIRECT" || $tipoAlbero =="REC"){
                    // in questo caso le categorie o sono tutte di root 
                    //o le categorie child e il relativo livello sono state specificate
                    return true;
                }
                elseif($tipoAlbero=="LEN"){
                    // la creazione dell'albero si basa sulla lunghezza dei codici di categoria e del
                    // moltiplicatore
                    
                }
                
                else{
                    throw new AppException('Non è possibie creare l\'albero, tipo non valido, controlla le configurazioni');
}
*/