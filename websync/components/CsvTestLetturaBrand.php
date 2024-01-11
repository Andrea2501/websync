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

use Tecnotrade\Websync\Models\SupportBrandTable as BrandTable; 
use Tecnotrade\Websync\Models\TableBrandFields as ClientBrandFields;


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




class CsvTestLetturaBrand extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'CSV Test Lettura Dati Brand Dinamici',
            'description' => 'Dynamic Brand Test Binding'
        ];
    }
    public function defineProperties(){
        return [];
    }
    public function onInit()
    {
       
    // Rest of your code
    }
    public $websyncConfiguration=array();
    public $rulesToBind=array();
    public $tipoClientData;
    protected $numRecordCorretti;
    protected $numRecordSaltati;
    protected $numRecordErrati;
    protected $codiciRecordErrati=[];
    protected $numeroTotaleRecordcsv;

    public function onRun(){
        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        if($this->tipoClientData=="CSV"){
            $this->websyncConfiguration=CommonConfigFunction::getCsvConfiguration('BRAND');
            
            //dd($this->websyncConfiguration);
            //$token=$this->getAuthToken($this->websyncConfiguration);
            //$result=$this->getRaggruppamenti($token);
            //dd($result);
            $this->setDataForCsv();
           
            // controllo che sia stata impostata una chiave univoca al modello esterno e associata al campo
            //user_defined_id
            $hasPk=$this->checkPrimaryKeyExists();
            if($hasPk===false){
                throw new AppException('Brand: Non hai specificato la chiave primaria, o non l\'hai associata al campo corretto.');
            }
            $this->prepareSincroBrands();
            


                
        }
        
        
        //dd($this->websyncCategoryConfiguration);
    }
    protected function checkPrimaryKeyExists(){
        $elements=$this->rulesToBind;
        foreach($elements as $element){
            if($element["mallField"]=="brand_code"){
               
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
    protected function getClientCsvPrimaryKey(){
        $elements=$this->rulesToBind;
        $nomeChiave='';
        foreach($elements as $element){
            if($element["mallField"]=="brand_code"){
               
                foreach($element["fields"] as $field){
                    $nomeChiave=$field["nomeCampo"];
                    return $nomeChiave;
                }
            }
        }
    }
    public function setDataForCsv(){
        $res=$this->prepareCsvBrandRules();
        if($res!==true){
            throw new AppException('Si  è verificato un problema nella creazione delle regole dei Brand.');  
        }
    }
    public function prepareCsvBrandRules() {
       
        
        $allBrandFields=ClientBrandFields::all();
        
        //dd($allCategoriesFields);
        if($allBrandFields && count($allBrandFields)>0){
            foreach($allBrandFields as $pField){
                
                if(!$pField->clientbrandrules){
                    continue;
                }
                $ruleRelation=$pField->clientbrandrules;
                
                $fieldTypeMaxLength=$pField->fieldtype->max_length;
                $mallField=$pField->field_name;            
                if(!$ruleRelation->clientbrandfields){
                    continue;
                }
                $clientFields=$ruleRelation->clientbrandfields;   
                                 
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
                    "isSlug"=>$ruleRelation->is_slug===0 ? null:true,
                    "isRelationWithProductTable"=>empty($pField->is_relation_with_product_table) ? null:true,
                    "isPrimaryKey"=>$pField->is_primary_key===0 ? null:true,
                    "isDateToCompare"=>$ruleRelation->is_data_update,
                    "maxLength"=>$fieldTypeMaxLength,
                    "fields"=>$ruleFields,
                    "mallField"=>$mallField,
                    
                ];
                
                
                $this->rulesToBind[]=$regole;
              
                
            }
            
            return true;
            
        }
        else{

            throw new AppException('Non hai effettuato il binding corretto con la tabella marchi');
        }
    }
    protected function prepareSincroBrands(){
        $conf=$this->websyncConfiguration;
        $type=$conf["type"];
        $recordPerPage=100;
        $currentPage=1;
        $useDataForUpdate=null;
        $dataParamNameFormat=null;
        
        if($conf["updateFieldName"] && !empty($conf["updateFieldName"])){
            $useDataForUpdate=true;
            $dataParamNameFormat=$conf["updateDateFormat"];
        }
        
        if($type=="CSV"){
                           
            $t=$this->getBrands($conf,$recordPerPage,$currentPage,$useDataForUpdate,$dataParamNameFormat,0);
            
            
        }
    }
    protected function getBrands($configData,$recordPerPage=null,$page=1,$useDataForUpdate=null,$dataParamNameFormat=null,$numRowToRead=null){
        
        /*
         $sincroConfig=[
            "type"=>"CSV",
            "updateFieldName"=>$postParamDataUpdateName,
            "updateDateFormat"=>$postParamDataUpdateFormat,
            "productFileName"=>$productFileName,
            "categoryFileName"=>$categoryFileName,
            "brandFileName"=>$brandFileName,
            "fieldsSeparator"=>$fieldSeparator,
            "hasHeader"=>$postHasHeader,
            "useFieldNumber"=>$useFieldNumber,
            "useFtp"=>$useFtp,
        ];
        */
        $dataDiModifica = null;
        $brandFileName=$configData["brandFileName"];
        $hasHeader = $configData["hasHeader"];
        $fieldSeparator=$configData["fieldsSeparator"];
        $articoliParamNumPerPageName=null;
        $articolParamPageToReadName=null;
        $articoliParamDataUpdateName=null;
        
     
        // nome del campo che contine la chiave primaria del prodotto nelle api
        $pKey=$this->getClientCsvPrimaryKey();
        
        $pageToread=(int)$page;
        $numPerPage=(int)$recordPerPage;   
        $articoliParamDataUpdateName=$configData["updateFieldName"];
        $dataDiModifica=Carbon::now()->subDays(1)->format($dataParamNameFormat);    
        $csv='';
        $filePath='';
        $chunkSize = $numPerPage;
        $startingRecord=$chunkSize*($pageToread-1);
        if( $page!="1" && $this->numeroTotaleRecordcsv <= $startingRecord){
            return true;
        }
        
        try{
            $filePath = storage_path('app/media/'.$brandFileName);
            $csv = Reader::createFromPath($filePath, 'r');
            
        }
        catch(Exception $ex){
            $lastError = error_get_last();
            if ($lastError !== null) {
                dd($lastError);
            }
            throw new AppException($ex->getMessage().'pagina: '.$pageToread. ' total: '.$this->numeroTotaleRecordcsv);
        }



        $csv->setDelimiter($fieldSeparator);
        if($hasHeader===true){
            $csv->setHeaderOffset(0);
        }
        $totalRows = $csv->count();
        if($page=="1"){
            $this->numeroTotaleRecordcsv=$totalRows;
        }
        
        $statement = (new Statement())
        ->offset($startingRecord)
        ->limit($chunkSize);
        $chunkRecords = $statement->process($csv);
        $totalRecords=$numRowToRead;
        
        foreach ($chunkRecords as $record){    
          
            $valuePrimaryKey=$record[$pKey];
            $valueDate=$record[$articoliParamDataUpdateName];
            $date2 = Carbon::createFromFormat($dataParamNameFormat, $valueDate);
            if($date2 < $dataDiModifica){
                $result=$this->addToBrandsSupportTable($record,$pKey,$valuePrimaryKey);
                if($result=="1"){
                    $this->numRecordCorretti++;
                }
                else{
                    $this->numRecordErrati++;
                    $this->codiciRecordErrati[]=$valuePrimaryKey;
                }
                
            }
            else{
                    
                $this->numRecordSaltati++;
            }
            //dd($valuePrimaryKey);
                
            $totalRecords++;
        } 
        $nextPage=(int)$page + 1;
        return $this->getBrands($configData,$recordPerPage,$nextPage,$useDataForUpdate,$dataParamNameFormat,$totalRecords);    
        
        
    }
    protected function addToBrandsSupportTable($brand,$pKeyClient,$pKeyClientvalue){
        
        $rules=$this->rulesToBind;
        
        
        $chiavePrimariaCsvClient=$this->getClientCsvPrimaryKey();
        $stringToTest='';
        $action="NEW";
       
        $brandAppoggio=BrandTable::where('brand_code','=',$pKeyClientvalue)->first();
        if($brandAppoggio){
            $action="UPD";
        }
        else{
            $brandAppoggio=new BrandTable();
        }
        
        
        $nascondiBrand=null;
        foreach($rules as $rule){
            
            $ruleName=$rule["nomeRegola"];
            $pk=$rule["pk"];
            $isPrimaryKey=$rule["isPrimaryKey"];
            $brandField=$rule["mallField"];
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
                    $val=$brand[$f];
                    if (substr($val, 0, strlen($valueEliminaSeIniziaPer)) === $valueEliminaSeIniziaPer){
                       $nascondiBrand=true;
                    } 
                }
            }
            if($rule["eliminaSeUguale_a"] && !empty($rule["eliminaSeUguale_a"])){
                $valueEliminaSeUgualeA=$rule["eliminaSeUguale_a"];
                $arrFieldsToTake=explode(",",$clientFields);
                foreach($arrFieldsToTake as $f){
                    $val=$brand[$f];
                    if (substr($val, 0, strlen($valueEliminaSeUgualeA)) === $valueEliminaSeUgualeA){
                        $nascondiBrand=true;
                    } 
                }
            }
            if($action==="UPD"){
                if($pk=="1" || $isPrimaryKey=="1" || $brandField=='brand_code' || $brandField=='slug'){
                    
                    continue;
                }
            }
           
            
            // controllo se devo sommare i campi come numeri
            
            if($rule["sommaCampiNumerici"] && count($rule["fields"]) >0 ){
                $valueToSave=0;
                $arrFieldsToTake=explode(",",$clientFields);
                foreach($arrFieldsToTake as $f){
                    $val=$brand[$f];
                    $valueToSave+=$val;
                }
                $brandAppoggio->{$brandField}=$valueToSave;
                $valueAssigned=true;           
            }

            

            // SE NON HO ASSEGNATO IL VALORE PER AGGREGAZIONE NUMERICA CONTROLLO SE ASSEGNO PER CONCAT STRING

            if($rule["concatenaStringhe"] && count($rule["fields"]) >0 && $valueAssigned===false){
                $valueToSave='';
                $arrFieldsToTake=explode(",",$clientFields);
                    foreach($arrFieldsToTake as $f){
                        $val=$brandField[$f];
                        $valueToSave.=' '.$val;

                    }
                $brandAppoggio->{$brandField}=$valueToSave;
                $valueAssigned=true;    
            }

            // // SE NON CI SONO REGOLE DI AGGREGAZIONE ASSEGNO IL VALORE NON HO ASSEGNATO IL VALORE PER QUESTA REGOLA
            if($valueAssigned==false){
                foreach($rule["fields"] as $field){
                    $fieldName=trim($field["nomeCampo"]);
                    
                    $val=$brand[$fieldName];
                    $valueToSave=$val;
                    $brandAppoggio->{$brandField}=$val;
                    $valueAssigned=true;
                    break;
                }
            }
            
            
        }
        if($nascondiBrand){
            $brandAppoggio->visibility=0;
        }
        
        $brandAppoggio->import_status=1;


        
        try{
          
            $xId=$brandAppoggio->save();
            
            return 1;   
            
        }
        catch(Exception $ex){
            $errore=throw new AppException($ex->getMessage());
            return 0;
        }
        
    }    

}