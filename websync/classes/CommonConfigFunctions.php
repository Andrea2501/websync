<?php namespace Tecnotrade\Websync\Classes;
use October\Rain\Exception\ApplicationException as AppException;
use Tecnotrade\Websync\Models\ConfigSetting As SyncSetting;
use Tecnotrade\TecnotradeWebsyncCategorySetting\Models\ConfigSetting as CatConfigSetting;
use Exception;

use Carbon\Carbon;

class CommonConfigFunctions{


    private static $configSincroType = [
        'PRODOTTI_CONF' => 'PRODOTTI',
        'CATEGORY_CONF' => 'CATEGORIE',
        'BRAND_CONF' => 'BRAND',
    ];

    
    
    
    public static function getApiConfiguration($tipoSincro){
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
        
        self::checkEmptyConfiguration($username,'Username');
        self::checkEmptyConfiguration($password,'Password');
        if($tokenRequired){
            self::checkEmptyConfiguration($tokenRequired,'Specifa richiesta token');
            if($tokenRequired=="1"){
                self::checkEmptyConfiguration($urlLetturaToken,'Url lettura token');
                self::checkEmptyConfiguration($postParamNameToken,'Nome parametro da passare per ottenre il token');
            }
        }
        
        self::checkEmptyConfiguration($postParamNamePassword,'Nome parametro contenente la password');
        self::checkEmptyConfiguration($postParamNameUsername,'Nome parametro contenente lo username');
        self::checkEmptyConfiguration($chiamataApiProdotti,'Non hai inserito url chiamata a Api Prodotti');
        self::checkEmptyConfiguration($chiamataApiCategorie,'Non hai inserito url chiamata a Api Categorie');
        self::checkEmptyConfiguration($chiamataApiBrand,'Non hai inserito url chiamata a Api Brand');
        self::checkEmptyConfiguration($variabileResultsProdotti,'Non hai inserito la variabile contente i risultati della chiamata a Api prodotti');
        self::checkEmptyConfiguration($variabileResultsCategorie,'Non hai inserito la variabile contente i risultati della chiamata a Api categories');
        self::checkEmptyConfiguration($variabileResultsBrands,'Non hai inserito la variabile contente i risultati della chiamata a Api Brand');
        
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
        $categoryConfig=null;
        if($tipoSincro=="CATEGORIE"){
            $categoryConfig=self::getCategoryApiConfiguration();
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
                "categorySettings"=>$categoryConfig,
            ];
        }

        
        return $sincroConfig;
    }
   
    
    public static function getCategoryApiConfiguration(){
        $isRootIfParentNull=CatConfigSetting::get('is_root_cat_if_father_null');
        $isRootIfParentlenght=null;
        if(!$isRootIfParentNull){
            $isRootIfParentlenght=CatConfigSetting::get('is_root_if_cat_code_lenght_is');
            if(!$isRootIfParentlenght){
                throw new AppException('Devi specificare come riconoscere una categoria di root nelle configurazioni categorie in impostazioni');
            }    
        }
        $isChildIfParentExists=true;
        $categoryTreeType=CatConfigSetting::get('category_tree_type');
        $treeLevelRootCodeLenght=null;
        $treeLevelRootMoltiplier=null;
        $treeMethod=null;
        if($categoryTreeType && !empty($categoryTreeType)){
            switch ($categoryTreeType){
                case "1":
                    $treeMethod="ONE";
                    break;
                case "2":
                    $treeMethod="DIRECT";
                    break;
                case "3":
                    $treeMethod="LEN";
                    $treeLevelRootCodeLenght=CatConfigSetting::get('cat_root_lenght');
                    if ($treeLevelRootCodeLenght && !empty($treeLevelRootCodeLenght) && is_numeric($treeLevelRootCodeLenght) && $treeLevelRootCodeLenght > 0 ){
                        $treeLevelRootMoltiplier=CatConfigSetting::get('cat_child_multiplier');
                        if(!$treeLevelRootMoltiplier || empty($treeLevelRootMoltiplier) ){
                            throw new AppException('Devi specificare il moltiplicatore di lunghezza del codice delle categorie child nelle configurazioni categorie in impostazioni');

                        }
                        elseif(is_numeric($treeLevelRootMoltiplier) && $treeLevelRootMoltiplier < 2){
                            throw new AppException('Il moltiplicatore di lunghezza del codice delle categorie child deve essere maggiore di 1, controlla nelle configurazioni categorie in impostazioni');

                        }
                        elseif(!is_numeric($treeLevelRootMoltiplier)){
                            throw new AppException('Il valore del moltiplicatore di lunghezza del codice delle categorie child non sembra valido, controlla nelle configurazioni categorie in impostazioni');

                        }

                    }
                    else{
                        throw new AppException('Devi specificare la lunghezza del codice delle categorie di root nelle configurazioni categorie in impostazioni');

                    }
                    break;
                case "4":
                    $treeMethod="REC";
                    break;
                default:
                throw new AppException('Il valore selezionato nel tipo di albero da generare non sembra valido; vedi configurazione categorie in impostazioni');
        
            }
        }
        else{
            throw new AppException('Non hai specificato il tipo di albero da generare in configurazioni categorie in impostazioni');

        }

        $result=[
            "isRootIfParentNull"=>$isRootIfParentNull,
            "isRootIfCodeLength"=>$isRootIfParentlenght,
            "isChildIfParentExists"=>$isChildIfParentExists,
            "treeMethod"=>$treeMethod,
            "treeRootCodeLength"=>$treeLevelRootCodeLenght,
            "treeCodeMoltplier"=>$treeLevelRootMoltiplier,

        ];
        return $result;
    }

   protected static function checkEmptyConfiguration($configValue,$configName){
        if(empty(trim($configValue))){
            throw new AppException($configName.' : vuoto o non valido');
        }
    
    }
    public static function getGeneralConfiguration(){
        if(SyncSetting::get('dropdown1')){
            $tipoClientData=SyncSetting::get('dropdown1');
            return $tipoClientData;
        }
        else{
            throw new AppException('Non hai creato le configurazioni per il plugin');
        }
        
    }
    public static function getCsvConfiguration($tipoSincro){
        
        $postHasHeader=null;
        $postParamDataUpdateName=null;
        $postParamDataUpdateFormat=null;
        $productFileName='';
        $categoryFileName='';
        $brandFileName='';
        $useFieldNumber=null;
        $fieldSeparator='';
        $useFtp=null;
        
        if(SyncSetting::get('csv_post_date_update_param_name')){
            $postParamDataUpdateName=SyncSetting::get('csv_post_date_update_param_name');
            
        }
        else{
            throw new AppException('Non hai specificato il nome del campo contenente la data di aggiornamento del record');
        }
        
        
        if(SyncSetting::get('csv_post_date_update_format')){
            $postParamDataUpdateFormat=SyncSetting::get('csv_post_date_update_format');
            if(empty(trim($postParamDataUpdateFormat))){
                throw new AppException('Non hai specificato il formato data del campo contenente la data di aggiornamento del record'); 
            }
        }
        else{
            throw new AppException('Non hai specificato il formato data del campo contenente la data di aggiornamento del record');
        
        }
        if(SyncSetting::get('csv_header')){
            $postHasHeader=true;
        }
        
        
        
        if(SyncSetting::get('product_file_name')){
            $productFileName=SyncSetting::get('product_file_name');
        }
        else{
            throw new AppException('Non hai specificato il nome del file csv dei prodotti.');
            
        }
        if(SyncSetting::get('category_file_name')){
            $categoryFileName=SyncSetting::get('category_file_name');
        }
        else{
            throw new AppException('Non hai specificato il nome del file csv delle categorie.');
            
        }
        
        if(SyncSetting::get('brand_file_name')){
            $brandFileName=SyncSetting::get('brand_file_name');
        }
        else{
            throw new AppException('Non hai specificato il nome del file csv dei brand.');
            
        }
        if(SyncSetting::get('use_csv_number_position')){
            $useFieldNumber=true;
        }
        if(SyncSetting::get('fields_separator')){
            $fieldSeparator=SyncSetting::get('fields_separator');
        }
        else{
            throw new AppException('Non hai specificato il separatore tra i campi.');
        }
        if(SyncSetting::get('caricamento_csv_con_ftp')){
            if( SyncSetting::get('caricamento_csv_con_ftp')=="2"){
                $useFtp=true;
            }
            else{
                $useFtp=false;
            }
        }
        else{
            throw new AppException('Devi specificare se utilizzare un ftp per il caricamaneto dei file.');
        }
        
        self::checkEmptyConfiguration($postParamDataUpdateName,'Campo Update');
        self::checkEmptyConfiguration($postParamDataUpdateFormat,'Formato data campo update');
        
        self::checkEmptyConfiguration($productFileName,'Nome file prodotti');
        self::checkEmptyConfiguration($categoryFileName,'Nome file categorie');
        self::checkEmptyConfiguration($brandFileName,'Nome file brand');
        self::checkEmptyConfiguration($fieldSeparator,'Separatore dei campi');
       
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
        $categoryConfig=null;
        if($tipoSincro=="CATEGORIE"){
            $categoryConfig=self::getCategoryApiConfiguration();
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
                "categorySettings"=>$categoryConfig,
                
            ];
            
        }

        
        return $sincroConfig;
    }
    
    


}