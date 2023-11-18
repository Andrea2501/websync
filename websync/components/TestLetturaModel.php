<?php namespace Tecnotrade\Websync\Components;

use Cms\Classes\ComponentBase;
use Tecnotrade\Websync\Models\ClientProductRules as ClientProductRules;
use Tecnotrade\Websync\Models\ClientProductFields as ClientProductFields;
use Tecnotrade\Websync\Models\TableProductFields as SincroProductFields;

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

    public function onRun(){
        $this->prepareProductsRules();
    }

    public $regoleToBind=array();
    public $fieldBind=array();

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
                    "maxLength"=>$fieldTypeMaxLength,
                    "fields"=>$ruleFields,
                ];
                $this->regoleToBind[]=$regole;
                
            }
            dd($this->fieldBind);
            dd($this->regoleToBind);
           
        }
        else{

            throw new AppException('Non hai effettuato il binding corretto con la tabella prodotti');
        }
    }
}