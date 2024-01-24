<?php namespace Tecnotrade\Websync\Components;


use Artisan;
use Illuminate\Support\Facades\Http;
use Cms\Classes\ComponentBase;
use Tecnotrade\Websync\Models\ClientProductRules as ClientProductRules;
use Tecnotrade\Websync\Models\ClientProductFields as ClientProductFields;
use Tecnotrade\Websync\Models\TableProductFields as SincroProductFields;
use Tecnotrade\Websync\Models\ConfigSetting As SyncSetting;
use Tecnotrade\Websync\Models\SupportProductTable as ProductTable;
use October\Rain\Exception\ApplicationException as AppException;
use Tecnotrade\Websync\Classes\CommonConfigFunctions as CommonConfigFunction;
use Exception;



use League\Csv\Reader;
use League\Csv\Statement;

use Carbon\Carbon;
use Log;



class CsvTestLetturaProdotti extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'CSV Test Lettura Dati Prodotti Dinamica',
            'description' => 'CSV Dynamic Product Test Binding'
        ];
    }
    public function defineProperties(){
        return [];
    }
    public function onInit()
    {
       
    // Rest of your code
    }
    public $rulesToBind=array();
    public $websyncConfiguration=array();
    public $tipoClientData;
    protected $numRecordCorretti;
    protected $numRecordSaltati;
    protected $numRecordErrati;
    protected $codiciRecordErrati=[];
    protected $numeroTotaleRecordcsv;

    public function onRun(){
        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        if($this->tipoClientData=="CSV"){
            $this->websyncConfiguration=CommonConfigFunction::getCsvConfiguration('PRODOTTI');
            $this->setDataForCsv();
            //dd($this->rulesToBind);
            $hasPk=$this->checkPrimaryKeyExists();
            if($hasPk!==true){
                throw new AppException('Non hai specificato la chiave primaria, o non l\'hai associata al campo corretto.');
            }
            $this->prepareSincroProducts();
            
        }
    }
    protected function checkPrimaryKeyExists(){
        $elements=$this->rulesToBind;
        foreach($elements as $element){
            if($element["mallField"]=="codice_interno_univoco"){
                $pk=$element["pk"];
                if($pk && $pk=="1"){
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
            if($element["mallField"]=="codice_interno_univoco"){
               
                foreach($element["fields"] as $field){
                    $nomeChiave=$field["nomeCampo"];
                    return $nomeChiave;
                }
            }
        }
    }
    public function setDataForCsv(){
        $res=$this->prepareCsvProductsRules();
        if($res!==true){
            throw new AppException('Si  è verificato un problema nella creazione delle regole dei prodotti.');  
        }
    }
    public function prepareCsvProductsRules() {
       
        
        $allProductFields=SincroProductFields::all();
        if($allProductFields && count($allProductFields)>0){
            foreach($allProductFields as $pField){
                if(!$pField->clientproductrules){
                    continue;
                }
                $ruleRelation=$pField->clientproductrules;
                $fieldTypeMaxLength=$pField->fieldtype->max_length;
                $mallField=$pField->field_name;            
                if(!$ruleRelation->clientproductfields){
                    continue;
                }
                $clientFields=$ruleRelation->clientproductfields;                    
                
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
                    /*$this->fieldBind[]=array(
                        "rule"=>$ruleRelation->rule_name,
                        "mallField"=>$mallField,
                        "fields"=>$ruleFields,
                    );
                    */
                }
                $regole=[
                    "nomeRegola"=>$ruleRelation->rule_name,
                    "idRegola"=>$ruleRelation->id,
                    "pk"=>$ruleRelation->primary_key,
                    "sommaCampiNumerici"=>$ruleRelation->somma_campi_numerici===0 ? null:true,
                    "concatenaStringhe"=>$ruleRelation->concatena_campi_come_stringa,
                    "eliminaSeIniziaPer"=>empty(trim($ruleRelation->elimina_da_mall_se_inizia_per))? null :$ruleRelation->elimina_da_mall_se_inizia_per ,
                    "eliminaSeUguale_a"=>$ruleRelation->elimina_da_mall_se_uguale_a,
                    "isSlug"=>$ruleRelation->is_slug===0 ? null:true,
                    "isRelationWithBrand"=>$pField->is_relation_field_with_brand_table===0 ? null:true,
                    "isRelationWithCategory"=>$pField->is_relation_field_with_category_table===0 ? null:true,
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

            throw new AppException('Non hai effettuato il binding corretto con la tabella prodotti');
        }
    }
    protected function prepareSincroProducts(){
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
               
            $t=$this->getArticles($conf,$recordPerPage,$currentPage,$useDataForUpdate,$dataParamNameFormat,0);
            
            
        }
    }

    protected function getArticles($configData,$recordPerPage=null,$page=1,$useDataForUpdate=null,$dataParamNameFormat=null,$numRowToRead=null){

        $dataDiModifica = null;
        $productFileName=$configData["productFileName"];
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
            $filePath = storage_path('app/media/'.$productFileName);
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
            if($date2 > $dataDiModifica){
                
                $result=$this->addToProductSupportTable($record,$pKey,$valuePrimaryKey);
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
        return $this->getArticles($configData,$recordPerPage,$nextPage,$useDataForUpdate,$dataParamNameFormat,$totalRecords);    
    }
    protected function addToProductSupportTable($articolo,$pKeyClient,$pKeyClientvalue){
        
        $rules=$this->rulesToBind;
       
        $chiavePrimariaApiClient=$this->getClientCsvPrimaryKey();
        $stringToTest='';
        $action="NEW";
       
        $articoloAppoggio=ProductTable::where('codice_interno_univoco','=',$pKeyClientvalue)->first();
        if($articoloAppoggio){
            $action="UPD";
        }
        else{
            $articoloAppoggio=new ProductTable;
        }
        
        $nascondiArticolo=null;
        foreach($rules as $rule){
            
            $ruleName=$rule["nomeRegola"];
            $pk=$rule["pk"];
            $isPrimaryKey=$rule["isPrimaryKey"];
            $productField=$rule["mallField"];
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
                    $val=$articolo[$f];
                    if (substr($val, 0, strlen($valueEliminaSeIniziaPer)) === $valueEliminaSeIniziaPer){
                       $nascondiArticolo=true;
                    } 
                }
            }
            if($rule["eliminaSeUguale_a"] && !empty($rule["eliminaSeUguale_a"])){
                $valueEliminaSeUgualeA=$rule["eliminaSeUguale_a"];
                $arrFieldsToTake=explode(",",$clientFields);
                foreach($arrFieldsToTake as $f){
                    $val=$articolo[$f];
                    if (substr($val, 0, strlen($valueEliminaSeUgualeA)) === $valueEliminaSeUgualeA){
                        $nascondiArticolo=true;
                    } 
                }
            }
            if($action==="UPD"){
                if($pk=="1" || $isPrimaryKey=="1" || $productField=='product_name' || $productField=='codice_interno_univoco' || $productField=='original_slug'){
                    
                    continue;
                }
            }
           
            
            // controllo se devo sommare i campi come numeri
            
            if($rule["sommaCampiNumerici"] && count($rule["fields"]) >0 ){
                $valueToSave=0;
                $arrFieldsToTake=explode(",",$clientFields);
                foreach($arrFieldsToTake as $f){
                    $val=$articolo[$f];
                    $valueToSave+=$val;
                }
                $articoloAppoggio->{$productField}=$valueToSave;
                $valueAssigned=true;           
            }

            

            // SE NON HO ASSEGNATO IL VALORE PER AGGREGAZIONE NUMERICA CONTROLLO SE ASSEGNO PER CONCAT STRING

            if($rule["concatenaStringhe"] && count($rule["fields"]) >0 && $valueAssigned===false){
                $valueToSave='';
                $arrFieldsToTake=explode(",",$clientFields);
                    foreach($arrFieldsToTake as $f){
                        $val=$articolo[$f];
                        $valueToSave.=' '.$val;

                    }
                $articoloAppoggio->{$productField}=$valueToSave;
                $valueAssigned=true;    
            }

            // // SE NON CI SONO REGOLE DI AGGREGAZIONE ASSEGNO IL VALORE NON HO ASSEGNATO IL VALORE PER QUESTA REGOLA
            if($valueAssigned==false){
                foreach($rule["fields"] as $field){
                    $fieldName=trim($field["nomeCampo"]);
                    
                    $val=$articolo[$fieldName];
                    $valueToSave=$val;
                    $articoloAppoggio->{$productField}=$val;
                    $valueAssigned=true;
                    break;
                }
            }
            
            
        }
        
        if($nascondiArticolo){
            $articoloAppoggio->visibility=0;
        }
        $articoloAppoggio->import_status=1;
        try{
            $xId=$articoloAppoggio->save();
            return 1;   
            
        }
        catch(Exception $ex){
            $errore=$ex->getMessage();
            return 0;
        }
        
    }    
}