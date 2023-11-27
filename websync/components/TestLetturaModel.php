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
use Exception;

use Carbon\Carbon;




class TestLetturaModel extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Test Lettura Dati Prodotti Dinamica',
            'description' => 'Dynamic Product Test Binding'
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
    public $csvConfiguration=array();
    public $websyncConfiguration=array();
    public $tipoClientData;

    public function onRun(){
        $this->tipoClientData=$this->getGeneralConfiguration();
        if($this->tipoClientData=="API"){
            $this->websyncConfiguration=$this->getApiConfiguration();
            //dd($this->websyncConfiguration);
            //prepareProductRules crea le regole e i campi che che evono essere associati alle regole API;
            $this->setDataForApi();
            // controllo che sia stata impostata una chiave univoca al modello esterno e associata al campo
            //user_defined_id
            $hasPk=$this->checkPrimaryKeyExists();
            if($hasPk===false){
                throw new AppException('Non hai specificato la chiave primaria, o non l\'hai associata al campo corretto.');
            }
            $this->prepareSincroProducts();
            //$this->testReadRule();
            
            //dd($this->websyncConfiguration);     
        }
        else{
            $this->csvConfiguration=$this->getCsvConfiguration();
        }

        /*$output=[];
        $resultCode=Artisan::call('websinc:initsincro',
        ['data' => $this->websyncConfiguration],
        $output);
        */
        //dd($resultCode);
       
    }

    public function setDataForApi(){
        $res=$this->prepareApiProductsRules();
        if($res!==true){
            throw new AppException('Si  è verificato un problema nella creazione delle regole dei prodotti.');  
        }
    }

    public function prepareApiProductsRules() {
       
        
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

    protected function getClientApiPrimaryKey(){
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


   

    

    

    protected function getGeneralConfiguration(){
        if(SyncSetting::get('dropdown1')){
            $tipoClientData=SyncSetting::get('dropdown1');
            return $tipoClientData;
        }
        else{
            throw new AppException('Non hai creato le configurazioni per il plugin');
        }
        
    }
    protected function getApiConfiguration(){
        $username='';
        $password='';
        $tokenRequired=0;
        $urlLetturaToken='';
        $postParamNameToken='';
        $postParamNamePassword='';
        $postParamNameUsername='';
        $postParamNamePage='';
        $postParamNamePerPageRecord='';
        $postParmNumRecordPerPage=0;
        $postParamDataUpdateName=null;
        $postParamDataUpdateFormat=null;
        $chiamataApiProdotti='';
        $chiamataApiCategorie='';
        $chiamataApiBrand='';
        $variabileResultsProdotti='';
        $variabileResultsCategorie='';
        $variabileResultsBrands='';
        

        
        if(SyncSetting::get('api_username') && SyncSetting::get('api_password')){
        $username=SyncSetting::get('api_username');
        $password=SyncSetting::get('api_password');
        }
        else{
            throw new AppException('Non hai creato le credenziali per le API da utilizzare');
        }
        if(SyncSetting::get('api_token_required')){
            $tokenRequired=SyncSetting::get('api_token_required');
            
        }
        if($tokenRequired=="1"){
            if(SyncSetting::get('api_url_per_ottenere_token')){
                $urlLetturaToken=SyncSetting::get('api_url_per_ottenere_token');
            }
            else{
                throw new AppException('Hai Impostato autenticazione tramite TOKEN ma non hai specificato la Chiamata per ottenre il TOKEN');
            }
            if(SyncSetting::get('api_param_post_token_name')){
                $postParamNameToken=SyncSetting::get('api_param_post_token_name');
            }
            else{
                throw new AppException('Non hai specificato il nome del parametro per passare il token alle chiamate API');
            }
            
            
        }
        if(SyncSetting::get('api_post_param_username_name') &&  SyncSetting::get('api_post_param_password_name')){
            $postParamNamePassword=SyncSetting::get('api_post_param_password_name');
            $postParamNameUsername=SyncSetting::get('api_post_param_username_name');
            
        }
        else{
            throw new AppException('Non hai specificato il nome del parametro per passare la password o lo username alle API');
        }
        if(SyncSetting::get('api_post_page_param_name')){
            $postParamNamePage=trim(SyncSetting::get('api_post_page_param_name'))==''? null : SyncSetting::get('api_post_page_param_name');
        }
        else{
            $postParamNamePage=null;
        }
        if(SyncSetting::get('api_post_per_page_param_name')){
            $postParamNamePerPageRecord=trim(SyncSetting::get('api_post_per_page_param_name'))==''? null : SyncSetting::get('api_post_page_param_name');
            
        }
        else{
            $postParamNamePerPageRecord=null;
        }
        if(SyncSetting::get('api_num_record_per_page')){
            $postParmNumRecordPerPage=SyncSetting::get('api_num_record_per_page');
        }
        else{
            $postParmNumRecordPerPage=null;
        }
        if(SyncSetting::get('api_post_date_update_param_name')){
            $postParamDataUpdateName=SyncSetting::get('api_post_date_update_param_name');
            if(SyncSetting::get('api_post_date_update_format')){
                $postParamDataUpdateFormat=SyncSetting::get('api_post_date_update_format');
            }
            else{
                throw new AppException('Hai specificato il parametro data di aggiornamento, devi specificarne anche il formato');
            }
        }
        else{
            $postParamDataUpdateName=null;
        }
        if(SyncSetting::get('api_toproducts')){
            $chiamataApiProdotti=SyncSetting::get('api_toproducts');
        }
        else{
            throw new AppException('Non hai specificato l\'url della Api Alla chimata dei prodotti.');
            
        }
        if(SyncSetting::get('api_tocategories')){
            $chiamataApiCategorie=SyncSetting::get('api_tocategories');
        }
        else{
            throw new AppException('Non hai specificato l\'url della Api Alla chimata delle categorie.');
            
        }
        if(SyncSetting::get('api_tobrands')){
            $chiamataApiBrand=SyncSetting::get('api_tobrands');
        }
        else{
            throw new AppException('Non hai specificato l\'url della Api Alla chimata dei brand.');
        }
        if(SyncSetting::get('api_toproducts_result_name')){
            $variabileResultsProdotti=SyncSetting::get('api_toproducts_result_name');
        }
        else{
            throw new AppException('Non hai specificato la variabile contenente i risultati resituiti dalla chiamata ai prodotti');

        }
        if(SyncSetting::get('api_tocategories_result_name')){
            $variabileResultsCategorie=SyncSetting::get('api_tocategories_result_name');
        }
        else{
            throw new AppException('Non hai specificato la variabile contenente i risultati resituiti dalla chiamata alle categorie');
            
        }
        if(SyncSetting::get('api_tobrands_result_name')){
            $variabileResultsBrands=SyncSetting::get('api_tobrands_result_name');
        }
        else{
            throw new AppException('Non hai specificato la variabile contenente i risultati resituiti dalla chiamata ai brand');
            
        }
        
        $this->checkEmptyConfiguration($username,'Username');
        $this->checkEmptyConfiguration($password,'Password');
        if($tokenRequired){
            $this->checkEmptyConfiguration($tokenRequired,'Specifa richiesta token');
            if($tokenRequired=="1"){
                $this->checkEmptyConfiguration($urlLetturaToken,'Url lettura token');
                $this->checkEmptyConfiguration($postParamNameToken,'Nome parametro da passare per ottenre il token');
            }
        }
        
        $this->checkEmptyConfiguration($postParamNamePassword,'Nome parametro contenente la password');
        $this->checkEmptyConfiguration($postParamNameUsername,'Nome parametro contenente lo username');
        $this->checkEmptyConfiguration($chiamataApiProdotti,'Non hai inserito url chiamata a Api Prodotti');
        $this->checkEmptyConfiguration($chiamataApiCategorie,'Non hai inserito url chiamata a Api Categorie');
        $this->checkEmptyConfiguration($chiamataApiBrand,'Non hai inserito url chiamata a Api Brand');
        $this->checkEmptyConfiguration($variabileResultsProdotti,'Non hai inserito la variabile contente i risultati della chiamata a Api prodotti');
        $this->checkEmptyConfiguration($variabileResultsCategorie,'Non hai inserito la variabile contente i risultati della chiamata a Api categories');
        $this->checkEmptyConfiguration($variabileResultsBrands,'Non hai inserito la variabile contente i risultati della chiamata a Api Brand');
        
        $sincroConfig=[
            "type"=>"API",
            "username"=>$username,
            "password"=>$password,
            "isTokenRequired"=>$tokenRequired,
            "urlLetturaToken"=>$urlLetturaToken,
            "tokenParamName"=>$postParamNameToken,
            "passwordParamName"=>$postParamNamePassword,
            "userParamName"=>$postParamNameUsername,
            "pageParamName"=>empty($postParamNamePage) ? null : $postParamNamePage,
            "perPageParamName"=>empty($postParamNamePerPageRecord) ? null : $postParamNamePerPageRecord,
            "numPerPage"=>$postParmNumRecordPerPage,
            "dataUpdateParamName"=>empty($postParamDataUpdateName) ? null : $postParamDataUpdateName,    
            "dataUpdateParamNameFormat"=>$postParamDataUpdateFormat,   
            "urlToProdotti"=>$chiamataApiProdotti,
            "urlToCategorie"=>$chiamataApiCategorie,
            "urlToBrand"=>$chiamataApiBrand,
            "apiProdottiResultName"=>$variabileResultsProdotti,
            "apiCategorieResultName"=>$variabileResultsCategorie,
            "apiBrandResultName"=>$variabileResultsBrands,
        ];
        

        return $sincroConfig;
        
        
        
    }
    protected function getCsvConfiguration(){

    }

    protected function checkEmptyConfiguration($configValue,$configName){
        if(empty(trim($configValue))){
            throw new AppException($configName.' : vuoto o non valido');
        }

    }

    protected function prepareSincroProducts(){
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
            $this->getArticles($conf,$usePagination,$recordPerPage,$currentPage,$useDataForUpdate,$dataParamNameFormat,$token);
            
            
        }
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
    
    protected function getArticles($configData,$usePagination=null,$recordPerPage=null,$page=1,$useDataForUpdate=null,$dataParamNameFormat=null,$token=null){

        
        $dataDiModifica = null;
        $articoliParamResultsname=$configData["apiProdottiResultName"];
        $articoliApiUrl = $configData["urlToProdotti"];
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
        $codiciArticoliConErrori=[];
        $data = json_encode($curl_post_data);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $articoliApiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_MAXREDIRS, 1110);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        $curl_response = curl_exec($ch);

        $result = json_decode($curl_response, true);
        if ($result && is_array($result) && count($result) > 0) {
            $products=$result[$articoliParamResultsname];
            
            if($products && is_array($products)){
                $numArticoliRestituiti=count($products);
                if($numArticoliRestituiti > 0){

                    /* SEZIONE PER PRENDER GLI ARTICOLI DAL CLIENT ED INSERIRLI NELLA TABELLA DI APPOGGIO */
                    /* bisogna prendere i campi ciclando sulle regole ed associarlo al model 
                    della tabella di appoggio*/
                    
                    
                    foreach ($products as $articolo) {
                        $contaRecord++;
                        $valuePrimaryKey=$articolo[$pKey];
                        //$articolo che leggo,
                        //$pKeynome del campo primarykey delle api
                        //$valuePrimaryKey=valore della chiave primaria
                        $result=$this->addToProductSupportTable($articolo,$pKey,$valuePrimaryKey);
                        
                        if($result=="1"){
                            $contaRecordCorretti++;
                        }
                        else{
                            $contaRecordConErrori++;
                            $codiciArticoliConErrori[]=$valuePrimaryKey;
                        }


                        
                    }
                    
               
                }
                echo  "Record elaborati: ".$contaRecord.'- record Corretti: '. $contaRecordCorretti.' - record con errori: '. $contaRecordConErrori ;
                // array contenente i codici articoli con errori $codiciArticoliConErrori;
            }
        }
    }
    protected function addToProductSupportTable($articolo,$pKeyClient,$pKeyClientvalue){
        
        $rules=$this->rulesToBind;
        $chiavePrimariaApiClient=$this->getClientApiPrimaryKey();
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
            if($rule["eliminaSeIniziaPer"] && !empty($rule["eliminaSeIniziaPer"])){
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
                if($pk=="1" || $isPrimaryKey=="1" || $productField=='product_name' || $productField=='codice_interno_univoco' || $productField='original_slug'){
                    
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