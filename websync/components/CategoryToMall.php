<?php namespace Tecnotrade\Websync\Components;


use Artisan;
use Illuminate\Support\Facades\Http;
use Cms\Classes\ComponentBase;

use Tecnotrade\Websync\Models\ClientCategoryFields as ClientCategoryFields;
use Tecnotrade\Websync\Models\TableCategoryFields as SincroCategoryFields;

use Tecnotrade\Websync\Models\ConfigSetting As SyncSetting;
use Tecnotrade\Websync\Models\SupportCategoryTable as CategoryTable;
use October\Rain\Exception\ApplicationException as AppException;
use Tecnotrade\TecnotradeWebsyncCategorySetting\Models\ConfigSetting as CatConfigSetting;
use Tecnotrade\Websync\Classes\CommonConfigFunctions as CommonConfigFunction;
use OFFLINE\Mall\Models\Category as MallCategory;
use Exception;

use Carbon\Carbon;
use Omnipay\Common\Issuer;

class CategoryToMall extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Importa Prodouct Category In Mall',
            'description' => 'Import Product Category to Mall'
        ];
    }
    public function defineProperties(){
        return [];
    }
    public function onInit()
    {
       
    // Rest of your code
    }
    public $categorySettings;
    public $webSyncSettings;
    public $tipoClientData;
    public $csvConfiguration;
    public function onRun(){
       
        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        $numCategories=0;
        
        if($this->tipoClientData=="API"){
            $this->webSyncSettings=CommonConfigFunction::getApiConfiguration('CATEGORIE');
            
            $this->categorySettings=$this->webSyncSettings["categorySettings"];
            $allCategories=CategoryTable::where('import_status','=',1)->get();
           
            
            if($allCategories){
                
                $numCategories=count($allCategories);
                if($numCategories > 0){
                    $result=$this->bindCategoriesToMall($allCategories);
                    if (is_array($result)){

                        // Creo l'albero di october e assegno gli id parent di october alla tabella di appoggio.
                        $result=$this->bindCategoriesTree();
                        if(is_numeric($result)){
                            dd($result);
                        }
                        else{
                            dd($result);
                        }
                    }
                }
                else{
                    dd("Non ci sono categorie da aggiornare");
                }
            }    
        }
        else{
            $this->csvConfiguration=$this->getCsvConfiguration();
        }
    }

    protected function bindCategoriesToMall($allCategories){
        $savedCategory=0;
        $errCategory=0;
        foreach($allCategories as $category){
            $row=[
                "nome"=>$category->name,
                "codiceUnivoco"=>$category->code,
                "slug"=>$category->slug,
                "meta_title"=>$category->meta_title,
                "meta_description"=>$category->meta_description,
                "description"=>$category->description,
                "shortDescription"=>$category->description_short,
                "parent_code"=>$category->parent_code,
                "nestDepth"=>$category->level,
                "octoberId"=>$category->october_id,
                "parentOctoberId"=>$category->october_parent_id,
                "importStatus"=>$category->import_status,
                    
            ];
            if(!empty($row["octoberId"] ) ){
                $idOctober=$this->updateMallCategory($row);
                if($idOctober){
                    if($idOctober > 0){
                        $category->october_id=$idOctober;
                        $category->import_status=2;    
                        $category->save();
                        $savedCategory++;
                    }
                    else{
                        // errore categoria non trovata per id october;
                        $errCategory++;
                    }
                }
                else{
                    // questa categoria non è stata salvata creare un log.
                    $errCategory++;
                }
            }
            else{
               $newMallCat=$this->addNewMallCategory($row);
               //aggiorno la categoria della tabella di appoggio: attenzione devo ancora associare il parent_id_october
                if($newMallCat){
                    $category->october_id=$newMallCat->id;
                    $category->import_status=2;
                    $category->save();
                    $savedCategory++;
                }
                else{
                    // questa categoria non è stata salvata creare un log.
                    $errCategory++;
                }
            }
        }
        return $result=[
            "categorieOk"=>$savedCategory,
            "categorieKo"=>$errCategory,
        ];
    }

    protected function addNewMallCategory($cat){
        
        
        $mallCategory=new MallCategory;
        $mallCategory->name=$cat["nome"];
        $mallCategory->slug=$cat["slug"];
        $mallCategory->code=$cat["codiceUnivoco"];
        if(empty($cat["meta_title"])){
           
            $mallCategory->meta_title=$cat["nome"];
        }
        else{
            
            $mallCategory->meta_title=$cat["meta_title"];
        }
        if(empty($cat["meta_description"])){
            $mallCategory->meta_description=$cat["description"];
        }
        else{
            $mallCategory->meta_description=$cat["meta_description"];
        }
        /* ATTENZIONE POTREBBE NON ESISTERE ANCORA LA CATEGORIA PADRE QUINDI FAREMO UN CONTROLLO AL TERMINE DEL CICLO*/
        if(!empty($cat["parent_code"])){
            $parentCategory=MallCategory::where('code','=',$cat["parent_code"])->first();
            if($parentCategory){
                $mallCategory->parent_id=$parentCategory->id;
            }
        }
        else{
            $mallCategory->parent_id=null;
        }
        $mallCategory->nest_depth=$cat["nestDepth"];
        $mallCategory->description=$cat["description"];
        $mallCategory->description_short=$cat["shortDescription"];
        $mallCategory->save();   
        return $mallCategory;
        
        
    }
    protected function updateMallCategory($cat){
       
        $idOctober=$cat["octoberId"];
        $mallCategory=MallCategory::find($idOctober);
        if($mallCategory){
            if(empty($cat["meta_title"])){
           
                $mallCategory->meta_title=$cat["nome"];
            }
            else{
                
                $mallCategory->meta_title=$cat["meta_title"];
            }
            if(empty($cat["meta_description"])){
                $mallCategory->meta_description=$cat["description"];
            }
            else{
                $mallCategory->meta_description=$cat["meta_description"];
            }
            $mallCategory->description=$cat["description"];
            $mallCategory->description_short=$cat["shortDescription"];
            try{
                $idOctober=$mallCategory->save();    
                return $idOctober;   
                
            }
            catch(Exception $ex){
                $errore=$ex->getMessage();
                dd($errore);
                return null;
            }

        }
        else{
            return -1;
        }

       
    }
    protected function bindCategoriesTree(){
        $maxDepth=CategoryTable::max('level');
       
        $numCategories=0;
        if(!$maxDepth){
            // ci sono solo categorie di root
            $allCategories=CategoryTable::where('import_status','=',2)->get();
            foreach($allCategories as $cat){
                $idOctober=$cat->october_id;
                $cat->import_status=3;
                $cat->october_parent_id=null;
                $mallCategory=MallCategory::find($idOctober);
                if(isset($mallCategory)){
                    $mallCategory->parent_id=null;
                    $mallCategory->nest_depth=0;
                    try{
                        $mallCategory->save();
                        $cat->save();
                        $numCategories++;   
                        
                    }
                    catch(Exception $ex){
                        $errore=$ex->getMessage();
                        dd($errore);
                        return null;
                    }
                }
            }
        }
        else{
            for($l=0;$l<=$maxDepth;$l++){
                $allCategories=CategoryTable::where('level','=',$l)
                ->get();
                if($l=="0"){
                    foreach($allCategories as $cat){
                        $idOctober=$cat->october_id;
                        $cat->import_status=3;
                        $cat->october_parent_id=null;
                        $mallCategory=MallCategory::find($idOctober);
                        if(isset($mallCategory)){
                            $mallCategory->parent_id=null;
                            $mallCategory->nest_depth=0;
                            try{
                                $mallCategory->save();
                                $cat->save();
                                $numCategories++;   
                                
                            }
                            catch(Exception $ex){
                                $errore=$ex->getMessage();
                                dd($errore);
                                return null;
                            }
                        }
                    }
                }
                else{
                    foreach($allCategories as $cat){
                        //Dalla category attuale devo ricavare l'id di october del padre
                        $idOctober=$cat->october_id;
                        $parentCode=$cat->parent_code;
                        $fatherCat=MallCategory::where('code','=',$parentCode)->first();
                        if(isset($fatherCat)){
                            // esiste la categoria padre 
                            $idOctoberFather=$fatherCat->id;
                            $cat->october_parent_id=$idOctoberFather;
                            $cat->import_status=3;
                            // prendo la categorie di mall con id october_id e associo il padre ed il livello
                            $mallCategory=MallCategory::find($idOctober);
                            $mallCategory->parent_id=$idOctoberFather;
                            $mallCategory->nest_depth=$l;    
                            try{
                                $mallCategory->save();
                                $numCategories++;   
                            }
                            catch(Exception $ex){
                                $errore=$ex->getMessage();
                                dd($errore);
                                return null;
                            }    
                        }  
                        try{
                            $cat->save();
                        }
                        catch(Exception $ex){
                            $errore=$ex->getMessage();
                            dd($errore);
                            return null;
                        }
                    }
                        

                }
            }

            
        }
        return $numCategories;
    }
}