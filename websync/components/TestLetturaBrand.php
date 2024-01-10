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

use Carbon\Carbon;




class TestLetturaBrand extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Test Lettura Dati Brand Dinamici',
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
    public $csvConfiguration=array();
    public $tipoClientData;

    public function onRun(){
        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        if($this->tipoClientData=="API"){
            $this->websyncConfiguration=CommonConfigFunction::getApiConfiguration('BRAND');
            
            //dd($this->websyncConfiguration);
            //$token=$this->getAuthToken($this->websyncConfiguration);
            //$result=$this->getRaggruppamenti($token);
            //dd($result);
            $this->setDataForApi();
           
            // controllo che sia stata impostata una chiave univoca al modello esterno e associata al campo
            //user_defined_id
            $hasPk=$this->checkPrimaryKeyExists();
            if($hasPk===false){
                throw new AppException('Brand: Non hai specificato la chiave primaria, o non l\'hai associata al campo corretto.');
            }
            $this->prepareSincroBrands();
            


                
        }
        else{
            $this->csvConfiguration=$this->getCsvConfiguration();
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

    protected function getAuthToken($data){
        $userParamName=$data["userParamName"];
        $username=$data["username"];
        $password=$data["password"];
        $passwordParamName=$data["passwordParamName"];
        $urlApiLetturaToken=$data["urlLetturaToken"];

        // SIMULA LA CHIAMATA DI DEFAULT PER OTTENERE IL TOKEN
        $response = Http::post($urlApiLetturaToken, [
            $userParamName => $username,
            $passwordParamName => $password,
        ]);
        if ($response->ok()) {
            
            return $response->body();
        } else {
            
            return null;
        }
            
    }
    protected function getClientApiPrimaryKey(){
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
    public function setDataForApi(){
        $res=$this->prepareApiBrandRules();
        if($res!==true){
            throw new AppException('Si  è verificato un problema nella creazione delle regole dei Brand.');  
        }
    }
    public function prepareApiBrandRules() {
       
        
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

            throw new AppException('Non hai effettuato il binding corretto con la tabella brand');
        }
    }
    protected function prepareSincroBrands(){
        $conf=$this->websyncConfiguration;
        $type=$conf["type"];
        $usePagination=false;
        $recordPerPage=null;
        $currentPage=null;
        $useDataForUpdate=null;
        $token=null;
        $dataParamNameFormat=null;
        if($conf["pageParamName"] && !empty($conf["pageParamName"])){
            $usePagination=true;
            $recordPerPage=$conf["numPerPage"];
            $currentPage=1;    
        }
        if($conf["dataUpdateParamName"] && !empty($conf["dataUpdateParamName"])){
            $useDataForUpdate=true;
            $dataParamNameFormat=$conf["dataUpdateParamNameFormat"];
        }
        if($type=="API"){
            if($conf["isTokenRequired"]=="1"){
                
                $token=$this->getAuthToken($conf);
                if(!$token){
                    throw new AppException('Non sono riuscito ad ottenere il token.');
                }
            }               
            $this->getBrands($conf,$usePagination,$recordPerPage,$currentPage,$useDataForUpdate,$dataParamNameFormat,$token);
            
            
        }
    }

    protected function getBrands($configData,$usePagination=null,$recordPerPage=null,$page=1,$useDataForUpdate=null,$dataParamNameFormat=null,$token=null){

        
        $dataDiModifica = null;
        $brandsParamResultsname=$configData["apiBrandResultName"];
        $brandApiUrl = $configData["urlToBrand"];
        $articoliParamTokenName=null;
        $articoliParamNumPerPageName=null;
        $articolParamPageToReadName=null;
        $articoliParamDataUpdateName=null;
        // nome del campo che contine la chiave primaria del prodotto nelle api
        $pKey=$this->getClientApiPrimaryKey();
        
        $pageToread=$page;
        $numPerPage=$recordPerPage;
        if($token){
            $articoliParamTokenName=$configData["tokenParamName"];  
        }
        if($usePagination){
            $articoliParamNumPerPageName=$configData["perPageParamName"];
            $articolParamPageToReadName=$configData["pageParamName"];
            
        }
        if($useDataForUpdate){
            $articoliParamDataUpdateName=$configData["dataUpdateParamName"];
            $dataDiModifica=Carbon::now()->subDays(5)->format($dataParamNameFormat);        
        }
        
        // dichiaro i post data 
        
        $curl_post_data=[];


        // controllo i valori se presenti 

        if($token){
            $curl_post_data[$articoliParamTokenName] = $token;
        }
        if($usePagination){
            $curl_post_data[$articolParamPageToReadName]=$pageToread;
            $curl_post_data[$articoliParamNumPerPageName]=$numPerPage;
        }
        if($useDataForUpdate){
            $curl_post_data[$articoliParamDataUpdateName]=$dataDiModifica;
        }
    

        

        
        $contaRecord=0;
        $contaRecordCorretti=0;
        $contaRecordConErrori=0;
        $codiciBrandConErrori=[];
        $data = json_encode($curl_post_data);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $brandApiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_MAXREDIRS, 1110);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        $curl_response = curl_exec($ch);

        $result = json_decode($curl_response, true);
        if ($result && is_array($result) && count($result) > 0) {
            $brands=$result[$brandsParamResultsname];
            
            if($brands && is_array($brands)){
                $numBrandRestituiti=count($brands);
                if($numBrandRestituiti > 0){
                   
                    /* SEZIONE PER PRENDER GLI ARTICOLI DAL CLIENT ED INSERIRLI NELLA TABELLA DI APPOGGIO */
                    /* bisogna prendere i campi ciclando sulle regole ed associarlo al model 
                    della tabella di appoggio*/
                    
                    
                    foreach ($brands as $brand) {
                        $contaRecord++;
                        $valuePrimaryKey=$brand[$pKey];
                        
                        //$articolo che leggo,
                        //$pKeynome del campo primarykey delle api
                        //$valuePrimaryKey=valore della chiave primaria
                        $result=$this->addToBrandsSupportTable($brand,$pKey,$valuePrimaryKey);
                        
                        if($result=="1"){
                            $contaRecordCorretti++;
                        }
                        else{
                            $contaRecordConErrori++;
                            $codiciBrandConErrori[]=$valuePrimaryKey;
                        }


                        
                    }
                    
               
                }
                echo  "Record elaborati: ".$contaRecord.'- record Corretti: '. $contaRecordCorretti.' - record con errori: '. $contaRecordConErrori ;
                // array contenente i codici articoli con errori $codiciArticoliConErrori;
                
                
                
            }
        }
    }
    protected function addToBrandsSupportTable($brand,$pKeyClient,$pKeyClientvalue){
        
        $rules=$this->rulesToBind;
        
        $chiavePrimariaApiClient=$this->getClientApiPrimaryKey();
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
            $errore=$ex->getMessage();
            return 0;
        }
        
    }    

    
    

}