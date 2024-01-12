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
use OFFLINE\Mall\Models\Product as MallProduct;
use OFFLINE\Mall\Models\Brand as MallBrand;
use OFFLINE\Mall\Models\Price as MallPrice;
use OFFLINE\Mall\Models\Tax as MallTax;
use OFFLINE\Mall\Models\Currency as MallCurrency;
use Tecnotrade\Websync\Models\SupportProductTable as ProductTable;
use Tecnotrade\Tecnotradewebsyncproductsetting\Models\ConfigSetting as ProductConfigSetting;
use Exception;
use DB;

use Carbon\Carbon;
use Omnipay\Common\Issuer;
use Tecnotrade\Websync\Models\SupportProductTable;

class ProductToMall extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Importa Product In Mall',
            'description' => 'Import Product  to Mall'
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
    public $productCategoriesInPivotTable;
    public $productsSettingMultiplier;
    public $productsSettingIdCurrency;
    public $productsSettingIdVat;

    public function onRun(){
            //get import data from tabella di apoggio
            //il prodotto inserito ha import_status="1" e october_id="1"
            /*se il binding con le categorie è 2 prendere le relazioni dalla tabella pivot 
            in caso contrario il prodotto appartiene ad una categoria e aggiungiamo la relazione 
            e l'id della categoria nella tabella di appoggio */
            /*associamo il brand e l'id nella tabella di appoggio*/ 
            /* se il prodotto non esiste associamo l'id mall di october*/
            /* se il prodotto esiste dobbiamo ricreare le realazioni:
            categorie:
            brand
            prezzi
            */
            /* aggiungere il moltiplicatore dei decimali che sono presenti nel prezzo siccome mall si spetta degli integer
            quindi se il prezzo è 1234.78 , iserire come moltiplicatore 100 in modo che mall riceva: 123478
            */ 


        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        if(CatConfigSetting::get('binding_products')){
            $this->productCategoriesInPivotTable=CatConfigSetting::get('binding_products');
        }
        else{
            throw new AppException("Devi specificare se il prodotto è associato ad una sola categoria o se deve essere usata una tabella pivot");
        
        }
        if(ProductConfigSetting::get('multiplier')){
            $this->productsSettingMultiplier=ProductConfigSetting::get('multiplier');
        }
        else{
            throw new AppException("Devi specificare il moltiplicatore del prezzo dei prodotti");
        
        }
        if(ProductConfigSetting::get('default_currency_id')){
            $this->productsSettingIdCurrency=ProductConfigSetting::get('default_currency_id');
        }
        else{
            throw new AppException("Devi specificare l'id della valuta di default");
        }
        if(ProductConfigSetting::get('id_default_vat')){
            $this->productsSettingIdVat=ProductConfigSetting::get('id_default_vat');
        }
        else{
            throw new AppException("Devi specificare l'id dell' iva di default");
        }
        if($this->tipoClientData=="API" || $this->tipoClientData=="CSV"){
            $getAllProducts=SupportProductTable::where('import_status','=',1)->get();

           


            foreach($getAllProducts as $p){
                if(!empty($p->october_id)){
                    //update product
                    
                    $result=$this->updateProduct($p);
                    if(!$result){
                        throw new AppException('Si è verificato un errore nella modifica del prodotto codice: '.$p->codice_interno_univoco);
                    }
                }
                else{
                   //NEW product 
                    $result=$this->addNewProduct($p);
                    
                    if(!$result){
                        throw new AppException('Si è verificato un errore nel salvataggio del prodotto codice: '.$p->codice_interno_univoco);
                    } 
                }
            }
            dd("FINE");
        }
        else{
            dd("BOH");
        }
    }

    protected function updateProduct($product){
        $idProdotto=$product->id;
        $product_name=$product->product_name;
        $uid=$product->codice_interno_univoco;
        $brand_code=$product->brand_code;
        $category_code=$product->category_code;
        $excerpt=$product->excerpt;
        $description=$product->description;
        $extended_description=$product->extended_description;
        $meta_title=$product_name;
        $meta_description=$excerpt;
        $qty_int_stock_int=$product->qty_in_stock_int;
        // CAMPO NON USATO OCTOBER ACCETTA SOLO INTEGER //
        $qty_int_stock_double=$product->qty_in_stock_double;
        $qty=null;
        if(!empty($qty_int_stock_int)){
            $qty=$qty_int_stock_int;
       
        }
        else{
            $qty=$qty_int_stock_double;
       
        }
        
        $inventory_management_method=$product->inventory_management_method;
        $allow_out_of_stock_purchase=$product->allow_out_of_stock_purchase;
        $stackable=$product->stackable;
        $shippable=$product->shippable;
        if(empty($price_included_taxes)){
            $price_included_taxes=0;
        }
        else{
            $price_included_taxes=$product->price_included_taxes;
        }
        $idIva=$this->productsSettingIdVat;
        $price=(int)($product->price * $this->productsSettingMultiplier);
        $mpn=$product->mpn;
        $gtin=$product->gtin;
        $original_slug=$product->original_slug;
        $october_id=$product->october_id;
        $import_status=1;
        $slug=$original_slug;
        $visibility=$product->visibility;
        $updated_at=$product->updated_at;
        $idCurrency=$this->productsSettingIdCurrency;
        $idBrand=$product->brand_october_id;
        $idCategory=null;
        
        if($this->productCategoriesInPivotTable=="1"){
            $idCategory=$product->category_october_id;
        }
        $mallProduct=MallProduct::find($october_id);
        $mallProduct->user_defined_id=$uid;
        $mallProduct->brand_id=$idBrand;
        $mallProduct->description_short=$excerpt;
        $mallProduct->description=$description;
        $mallProduct->meta_description=$meta_description;
        $mallProduct->additional_descriptions=$extended_description;
        $mallProduct->stock=$qty;
        if(empty($inventory_management_method)){
            $inventory_management_method='single';
        }
        $mallProduct->inventory_management_method=$inventory_management_method;
        if(empty($allow_out_of_stock_purchase)){
            $allow_out_of_stock_purchase=0;
        }
        $mallProduct->allow_out_of_stock_purchases=$allow_out_of_stock_purchase;
        $mallProduct->published=$visibility;
        $mallProduct->updated_at=$updated_at;
        $mallProduct->mpn=$mpn;
        $mallProduct->gtin=$gtin;

        // salvo il prodotto
        // rimuovo le relazioni da category e price
        // associo alle categorie da pivot o da single
        // creo il prezzo
        $mallProduct->save();
        $idMallProduct=$mallProduct->id;
        $result=$this->detachProductRelationship($mallProduct);
        if($result){
           $result2=$this->createProductRelationship($mallProduct,$idCategory,$price,$idIva,$idCurrency);
           if($result2){
                $product->import_status=2;
                $product->save();
                return true;
           }
           else{
            return null;
           } 
        }
        else{
            return null;
        }

    }
    protected function addNewProduct($product){
        $idProdotto=$product->id;
        $product_name=$product->product_name;
        $uid=$product->codice_interno_univoco;
        $brand_code=$product->brand_code;
        $category_code=$product->category_code;
        $excerpt=$product->excerpt;
        $description=$product->description;
        $extended_description=$product->extended_description;
        $meta_title=$product_name;
        $meta_description=$excerpt;
        $qty_int_stock_int=$product->qty_in_stock_int;
        // CAMPO NON USATO OCTOBER ACCETTA SOLO INTEGER //
        $qty_int_stock_double=$product->qty_in_stock_double;
        $qty=null;
        if(!empty($qty_int_stock_int)){
            $qty=$qty_int_stock_int;
       
        }
        else{
            $qty=$qty_int_stock_double;
       
        }
        
        $inventory_management_method=$product->inventory_management_method;
        $allow_out_of_stock_purchase=$product->allow_out_of_stock_purchase;
        $stackable=$product->stackable;
        $shippable=$product->shippable;
        if(empty($price_included_taxes)){
            $price_included_taxes=0;
        }
        else{
            $price_included_taxes=$product->price_included_taxes;
        }
        $idIva=$this->productsSettingIdVat;
        $price=(int)($product->price * $this->productsSettingMultiplier);
        
        $mpn=$product->mpn;
        $gtin=$product->gtin;
        $original_slug=$product->original_slug;
        $october_id=null;
        $import_status=1;
        $slug=$original_slug;
        $visibility=$product->visibility;
        $updated_at=$product->updated_at;
        $idCurrency=$this->productsSettingIdCurrency;
        $idBrand=null;
        $idCategory=null;
        $mallBrand=MallBrand::where('code','=',$brand_code)->first();
        if($mallBrand){
            
            $idBrand=$mallBrand->id;
            $product->brand_october_id=$idBrand;
            $product->save();

        }
        if($this->productCategoriesInPivotTable=="1"){
            // associazione ad una sola categoria
            
            $mallCategory=MallCategory::where('code','=',$category_code)->first();
            if($mallCategory){
                $idCategory=$mallCategory->id;
                $product->category_october_id=$idCategory;
                $product->save();
                
            }
            else{
                throw new AppException('Codice Categoria: '.$category_code.' Non trovato nel prodotto:'.$idProdotto.' Della support table');
            }
        }
        $mallProduct=new MallProduct;
        $mallProduct->user_defined_id=$uid;
        $mallProduct->brand_id=$idBrand;
        $mallProduct->name=$product_name;
        //$mallProduct->slug=$slug;
        $mallProduct->description_short=$excerpt;
        $mallProduct->description=$description;
        $mallProduct->meta_title=$meta_title;
        $mallProduct->meta_description=$meta_description;
        $mallProduct->additional_descriptions=$extended_description;
        $mallProduct->stock=$qty;
        if(empty($inventory_management_method)){
            $inventory_management_method='single';
        }
        $mallProduct->inventory_management_method=$inventory_management_method;
        if(empty($allow_out_of_stock_purchase)){
            $allow_out_of_stock_purchase=0;
        }
        $mallProduct->allow_out_of_stock_purchases=$allow_out_of_stock_purchase;
        if(empty($stackable)){
            $mallProduct->stackable=1;
        
        }
        else{
            $mallProduct->stackable=$stackable;
        }
        if(empty($shippable)){
            $mallProduct->shippable=1;
        }
        else{
            $mallProduct->shippable=$shippable;
        }
        $mallProduct->price_includes_tax=$price_included_taxes;
        $mallProduct->published=$visibility;
        $mallProduct->updated_at=$updated_at;
        $mallProduct->mpn=$mpn;
        $mallProduct->gtin=$gtin;

        // salvo il prodotto
        // associo alle categorie da pivot o da single
        // creo il prezzo associo a tasse e valuta
        $mallProduct->save();
        $idMallProduct=$mallProduct->id;
        $result=$this->createProductRelationship($mallProduct,$idCategory,$price,$this->productsSettingIdVat,$this->productsSettingIdCurrency);
        if($result){
            $product->october_id=$idMallProduct;
            $product->import_status=2;
            $product->save();
            return true;
        }
        else{
            return null;
        }
    }
    protected function detachProductRelationship($product)
    {
        $product->categories()->detach();
        $product->taxes()->detach();
        $deleted = DB::table('offline_mall_product_prices')->where('product_id', '=', $product->id)->delete();
        $price = MallPrice::where('priceable_id', '=', $product->id)->delete();
        return true;
    }

    protected function createProductRelationship($product,$idCategory,$price,$idVat,$idCurrency){
        //se è assegnata una solo categoria
        if($this->productCategoriesInPivotTable=="1"){
            $categoryProduct=MallCategory::find($idCategory);
            if($categoryProduct){
                $product->categories()->attach($categoryProduct);
            }
        }
        $productTax=MallTax::find($idVat);
        if($productTax){
            $product->taxes()->attach($productTax);
        }    
        $priceToInput=$price;    
        $defaultCurrency= MallCurrency::find($idCurrency);    
        $productPrice = new MallPrice;
        $productPrice->price = $priceToInput;
        $productPrice->currency_id = $defaultCurrency->id;
        $productPrice->priceable_id = $product->id;
        $productPrice->priceable_type = 'Product';
        $productPrice->save();
        DB::table('offline_mall_product_prices')->insert([
            'price' => $priceToInput,
            'product_id' =>  $product->id,
            'currency_id' => $defaultCurrency->id
        ]);
        return true;
    }
}