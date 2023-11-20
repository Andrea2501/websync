<?php namespace Tecnotrade\Websync\Components;

use Arr;
use Artisan;
use Cms\Classes\ComponentBase;
use Tecnotrade\Websync\Models\ClientProductRules as ClientProductRules;
use Tecnotrade\Websync\Models\ClientProductFields as ClientProductFields;
use Tecnotrade\Websync\Models\TableProductFields as SincroProductFields;
use Tecnotrade\Websync\Models\ConfigSetting As SyncSetting;

use October\Rain\Exception\ApplicationException as AppException;






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

    public $regoleToBind=array();
    public $fieldBind=array();
    public $csvConfiguration=array();
    public $websyncConfiguration=array();
    public $tipoClientData;

    public function onRun(){
        $this->tipoClientData=$this->getGeneralConfiguration();
        if($this->tipoClientData=="API"){
            $this->websyncConfiguration=$this->getApiConfiguration();
            
        }
        else{
            $this->csvConfiguration=$this->getCsvConfiguration();
        }
        $this->prepareProductsRules();
        $output=[];
        $resultCode=Artisan::call('websinc:initsincro',
        ['data' => $this->websyncConfiguration],
        $output);
        dd($resultCode);
        
        dd($this->websyncConfiguration);
    }

    

    public function prepareProductsRules() {
       
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
                    $this->fieldBind[]=array(
                        "rule"=>$ruleRelation->rule_name,
                        "mallField"=>$mallField,
                        "fields"=>$ruleFields,
                    );
                }
                $regole=[
                    "nomeRegola"=>$ruleRelation->rule_name,
                    "idRegola"=>$ruleRelation->id,
                    "pk"=>$ruleRelation->primary_key,
                    "sommaCampiNumerici"=>$ruleRelation->somma_campi_numerici===0 ? null:true,
                    "concatenaStringhe"=>$ruleRelation->concatena_come_campi_stringa,
                    "eliminaSeIniziaPer"=>empty(trim($ruleRelation->elimina_da_mall_se_inizia_per))? null :$ruleRelation->elimina_da_mall_se_inizia_per ,
                    "eliminaSeUguale_a"=>$ruleRelation->elimina_da_mall_se_uguale_a,
                    "isSlug"=>$ruleRelation->is_slug===0 ? null:true,
                    "isRelationWithBrand"=>$pField->is_relation_field_with_brand_table===0 ? null:true,
                    "isRelationWithCategory"=>$pField->is_relation_field_with_category_table===0 ? null:true,
                    "isPrimaryKey"=>$pField->is_primary_key===0 ? null:true,
                    "isDateToCompare"=>$ruleRelation->is_data_update,
                    "maxLength"=>$fieldTypeMaxLength,
                    "fields"=>$ruleFields,
                    
                ];
                
                $this->regoleToBind[]=$regole;
                
            }
            
        }
        else{

            throw new AppException('Non hai effettuato il binding corretto con la tabella prodotti');
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
            "pageParameName"=>empty($postParamNamePage) ? null : $postParamNamePage,
            "perPageParamName"=>empty($postParamNamePerPageRecord) ? null : $postParamNamePerPageRecord,
            "numPerPage"=>$postParmNumRecordPerPage,
            "dataUpdateParamName"=>empty($postParamDataUpdateName) ? null : $postParamDataUpdateName,    
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
}