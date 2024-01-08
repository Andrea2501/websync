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

use Carbon\Carbon;




class TestLetturaCategory extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Test Lettura Dati Categorie Dinamica',
            'description' => 'Dynamic Category Test Binding'
        ];
    }
    public function defineProperties(){
        return [];
    }
    public function onInit()
    {
       
    // Rest of your code
    }

    // POSSIBILI VALORI DEI SETTING DELLE CATEGORIE
    /*
    fields:
    'Root Se "CODICE CATEGORIA" Ha una lunghezza di numero caratteri':       
    is_root_if_cat_code_lenght_is:
    Root Se "CODICE CATEGORIA PADRE" è NULL o VUOTO:    
    is_root_cat_if_father_null:
    'Figlio se "CODICE CATEGORIA PADRE" non è NULL o non è VUOTO':
    is_child_if_parent_code_not_null:
    'Generazioni albero livelli:'    
    category_tree_type:
        options:
            1: 'Sono tutte categorie di Root: level 0' => 'ONE'
            2: 'Il livello verrà importato dal binding diretto del campo livello' => 'DIRECT'
            3: 'Il livello verrà calcolato in base alla lunghezza del codice di categoria' => 'LEN'
            4: 'Cerca di calcolare i livelli automaticamente' => 'REC'
        
    SE category_tree_type=3
    Specifica lunghezza "CODICE CATEGORIA DI ROOT" uguale a n caratteri
    cat_root_lenght:
    
    'Moltiplicatore del "CODICE CATEGORIA" per generare i livelli'
    cat_child_multiplier:
    

    ** Non Implementato
    'Tipo di binding con i prodotti'
    binding_products:
        options:
            1: 'STANDARD, 1 Prodotto può appartenere ad una sola categoria solo una categoria'
            2: 'Usa La Tabella Pivot'
        required: 1
        placeholder: 'Seleziona il tipo di binding'
        type: dropdown
    */
    public $websyncCategoryConfiguration;
    public $websyncConfiguration=array();
    public $rulesToBind=array();
    public $csvConfiguration=array();
    public $tipoClientData;


    public function onRun(){
        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        if($this->tipoClientData=="API"){
            $this->websyncCategoryConfiguration=CommonConfigFunction::getApiConfiguration('CATEGORIE');
            
            
            $this->setDataForApi();
            // controllo che sia stata impostata una chiave univoca al modello esterno e associata al campo
            //user_defined_id
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
        else{
            $this->csvConfiguration=$this->getCsvConfiguration();
        }
        
        //dd($this->websyncCategoryConfiguration);
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
            if($element["mallField"]=="code"){
               
                foreach($element["fields"] as $field){
                    $nomeChiave=$field["nomeCampo"];
                    return $nomeChiave;
                }
            }
        }
    }
    
    

    public function setDataForApi(){
        $res=$this->prepareApiCategoriesRules();
        if($res!==true){
            throw new AppException('Si  è verificato un problema nella creazione delle regole delle Categorie.');  
        }
    }

    public function prepareApiCategoriesRules() {
       
        
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

    

    protected function prepareSincroCategories(){
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

    protected function getCategories($configData,$usePagination=null,$recordPerPage=null,$page=1,$useDataForUpdate=null,$dataParamNameFormat=null,$token=null){

        
        $dataDiModifica = null;
        $categoriesParamResultsname=$configData["apiCategorieResultName"];
        $categoriesApiUrl = $configData["urlToCategorie"];
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
        $codiciCategorieConErrori=[];
        $data = json_encode($curl_post_data);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $categoriesApiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_MAXREDIRS, 1110);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        $curl_response = curl_exec($ch);

        $result = json_decode($curl_response, true);
        if ($result && is_array($result) && count($result) > 0) {
            $categories=$result[$categoriesParamResultsname];
            
            if($categories && is_array($categories)){
                $numCatRestituite=count($categories);
                if($numCatRestituite > 0){
                   
                    /* SEZIONE PER PRENDER GLI ARTICOLI DAL CLIENT ED INSERIRLI NELLA TABELLA DI APPOGGIO */
                    /* bisogna prendere i campi ciclando sulle regole ed associarlo al model 
                    della tabella di appoggio*/
                    
                    
                    foreach ($categories as $cat) {
                        $contaRecord++;
                        $valuePrimaryKey=$cat[$pKey];
                        
                        //$articolo che leggo,
                        //$pKeynome del campo primarykey delle api
                        //$valuePrimaryKey=valore della chiave primaria
                        $result=$this->addToCategorySupportTable($cat,$pKey,$valuePrimaryKey);
                        
                        if($result=="1"){
                            $contaRecordCorretti++;
                        }
                        else{
                            $contaRecordConErrori++;
                            $codiciCategorieConErrori[]=$valuePrimaryKey;
                        }


                        
                    }
                    
               
                }
                echo  "Record elaborati: ".$contaRecord.'- record Corretti: '. $contaRecordCorretti.' - record con errori: '. $contaRecordConErrori ;
                // array contenente i codici articoli con errori $codiciArticoliConErrori;
                // VADO A CREARE L ALBERO DEI LIVELLI;
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
                
            }
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
            
            return 1;   
            
        }
        catch(Exception $ex){
            $errore=$ex->getMessage();
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