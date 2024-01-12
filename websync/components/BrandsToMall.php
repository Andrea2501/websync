<?php namespace Tecnotrade\Websync\Components;


use Artisan;
use Illuminate\Support\Facades\Http;
use Cms\Classes\ComponentBase;

use Tecnotrade\Websync\Models\ClientBrandFields as BrandCategoryFields;
use Tecnotrade\Websync\Models\TableProductFields as SincroBrandFields;

use Tecnotrade\Websync\Models\ConfigSetting As SyncSetting;
use Tecnotrade\Websync\Models\SupportBrandTable as BrandTable;
use October\Rain\Exception\ApplicationException as AppException;
use Tecnotrade\TecnotradeWebsyncCategorySetting\Models\ConfigSetting as CatConfigSetting;
use Tecnotrade\Websync\Classes\CommonConfigFunctions as CommonConfigFunction;
use Tecnotrade\Tecnotradewebsyncproductsetting\Models\ConfigSetting as ProductConfigSetting;
use OFFLINE\Mall\Models\Brand as MallBrand;
use Exception;

use Carbon\Carbon;
use Omnipay\Common\Issuer;

class BrandsToMall extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Importa i Brand In Mall ',
            'description' => 'Importa Brand  in Mall'
        ];
    }
    public function defineProperties(){
        return [];
    }
    public function onInit()
    {
       
    // Rest of your code

    // aggiungo  e code brand in offline mall brand
    }
    public $categorySettings;
    public $webSyncSettings;
    public $tipoClientData;
    public $csvConfiguration;

    public function onRun(){

        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        $numBrands=0;
        
        if($this->tipoClientData=="API" || $this->tipoClientData=="CSV"){
          
            $allBrands=BrandTable::where('import_status','=',1)->get();
            
            if($allBrands){
                
                $numBrands=count($allBrands);
                if($numBrands > 0){
                    $result=$this->bindBrandsToMall($allBrands);
                    if (is_array($result)){

                       
                        if(is_numeric($result)){
                            dd($result);
                        }
                        else{
                            dd($result);
                        }
                    }
                }
                else{
                    dd("Non ci sono brand da aggiornare");
                }
            }    
        }
        else{
            $this->csvConfiguration=$this->getCsvConfiguration();
        }
    }

   
    protected function bindBrandsToMall($allBrands){
        $savedBrand=0;
        $errBrands=0;
        foreach($allBrands as $brand){
            $row=[
                "nome"=>$brand->brand_name,
                "codiceUnivoco"=>$brand->brand_code,
                "slug"=>$brand->slug,
                //"meta_title"=>$category->meta_title,
                //"meta_description"=>$category->meta_description,
                "description"=>$brand->description,
                //"shortDescription"=>$category->description_short,
                //"parent_code"=>$category->parent_code,
                //"nestDepth"=>$category->level,
                "octoberId"=>$brand->october_id,
                //"parentOctoberId"=>$category->october_parent_id,
                "importStatus"=>$brand->import_status,
                "website"=>$brand->web_site,
                    
            ];
            
            if(!empty($row["octoberId"] ) ){
                $idOctober=$this->updateBrand($row);
                if($idOctober){
                    if($idOctober > 0){
                        $brand->october_id=$idOctober;
                        $brand->import_status=2;
                        $brand->save();
                        $savedBrand++;
                    
                    }
                    else{
                        // errore categoria non trovata per id october;
                        $errBrands++;
                    }
                }
                else{
                    // questo brand non è stata salvato creare un log.
                    $errBrands++;
                }
            }
            else{
               $newMallBrand=$this->addNewMallBrand($row);
                if($newMallBrand){
                    $brand->october_id=$newMallBrand->id;
                    $brand->import_status=2;
                    $brand->save();
                    $savedBrand++;
                }
                else{
                    // questa categoria non è stata salvata creare un log.
                    $errBrands++;
                }
            }
        }
        return $result=[
            "brandOk"=>$savedBrand,
            "brandKo"=>$errBrands,
        ];
        
    }
    protected function addNewMallBrand($row){
        /* $row=[
                "nome"=>$brand->brand_name,
                "codiceUnivoco"=>$brand->brand_code,
                "slug"=>$brand->brand_slug,
                //"meta_title"=>$category->meta_title,
                //"meta_description"=>$category->meta_description,
                "description"=>$brand->brand_description,
                //"shortDescription"=>$category->description_short,
                //"parent_code"=>$category->parent_code,
                //"nestDepth"=>$category->level,
                "octoberId"=>$brand->october_id,
                //"parentOctoberId"=>$category->october_parent_id,
                "importStatus"=>$brand->import_status,
                "website"=>$brand->web_site,
                    
            ];
        */
        $newBrand=new MallBrand;
        $newBrand->name=$row["nome"];
        $newBrand->code=$row["codiceUnivoco"];
        $newBrand->slug=$row["slug"];
        $newBrand->description=$row["description"];
        if(!empty($row["website"])){
            $newBrand->website=$row["website"];
        }
        $newBrand->save();
        return $newBrand;


    }
    protected function updateMallBrand($row){
      
        $mallBrand=MallBrand::find($row["octoberId"]);
            if($mallBrand){
                $mallBrand->name=$row["nome"];
                $mallBrand->code=$row["codiceUnivoco"];
                $mallBrand->description=$row["description"];
                if(!empty($row["website"])){
                    $mallBrand->website=$row["website"];
                }
                $mallBrand->save();
                return $mallBrand->id;
            }
            else{
                return null;
            }


    }

}