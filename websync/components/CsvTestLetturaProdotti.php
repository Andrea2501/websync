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
use Tecnotrade\Websync\Classes\CommonConfigFunctions as CommonConfigFunction;
use Exception;



use League\Csv\Reader;
use League\Csv\Statement;

use Carbon\Carbon;
use Log;



class CsvTestLetturaProdotti extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'CSV Test Lettura Dati Prodotti Dinamica',
            'description' => 'CSV Dynamic Product Test Binding'
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
    public $websyncConfiguration=array();
    public $tipoClientData;
    protected $numRecordCorretti;
    protected $numRecordSaltati;
    protected $numRecordErrati;
    protected $codiciRecordErrati=[];
    protected $numeroTotaleRecordcsv;

    public function onRun(){
        $this->tipoClientData=CommonConfigFunction::getGeneralConfiguration();
        if($this->tipoClientData=="CSV"){
            $this->websyncConfiguration=CommonConfigFunction::getCsvConfiguration('PRODOTTI');
            $this->setDataForCsv();
            $hasPk=$this->checkPrimaryKeyExists();
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
    public function setDataForCsv(){
        $res=$this->prepareCsvProductsRules();
        if($res!==true){
            throw new AppException('Si  è verificato un problema nella creazione delle regole dei prodotti.');  
        }
    }
}