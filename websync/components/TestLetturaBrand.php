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
            dd($this->rulesToBind);
            // controllo che sia stata impostata una chiave univoca al modello esterno e associata al campo
            //user_defined_id
            /*$hasPk=$this->checkPrimaryKeyExists();
            if($hasPk===false){
                throw new AppException('Categorie: Non hai specificato la chiave primaria, o non l\'hai associata al campo corretto.');
            }
            $this->prepareSincroBrands();
            */


                
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

            throw new AppException('Non hai effettuato il binding corretto con la tabella prodotti');
        }
    }
    protected function prepareSincroBrands(){
        $conf=$this->websyncCategoryConfiguration;
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
            $this->getCategories($conf,$usePagination,$recordPerPage,$currentPage,$useDataForUpdate,$dataParamNameFormat,$token);
            
            
        }
    }

}