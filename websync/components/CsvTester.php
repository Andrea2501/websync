<?php namespace Tecnotrade\Websync\Components;

use Cms\Classes\ComponentBase;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use League\Csv\Reader;
use League\Csv\Statement;
use Hash;
use RainLab\User\Facades\Auth;
use RainLab\User\Controllers\Users;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use October\Rain\Network\Http as HttpNetwork;
use DB; 

class CsvTester extends ComponentBase
{

 
    public function componentDetails()
    {
        return [
            'name'        => 'Test Lettura Csv',
            'description' => 'Test lettura Csv'
        ];
    }

    public function defineProperties(){
            
        
    }

    public $csvFileName;


    public function onRun(){
        $this->csvFileName="offline_mall_brands.csv";
        $result=$this->cycleCsv($this->csvFileName,0,0);
        dd($result);
    }

    protected function cycleCsv($csvFileName,$page,$num){
        $filePath = storage_path('app/media/'.$csvFileName);
        $csv = Reader::createFromPath($filePath, 'r');
        $csv->setDelimiter(',');
        $csv->setHeaderOffset(0);
        $chunkSize = 25; // Numero di righe da leggere in ogni chunk
        $totalRows = $csv->count();
        $startingRecord=$chunkSize*$page;
        $statement = (new Statement())
        ->offset($startingRecord)
        ->limit($chunkSize);
        $chunkRecords = $statement->process($csv);
        $totalRecords=$num;
        if ($totalRows === $num) {
            // Invia una risposta indicando che non ci sono più righe da leggere
            return $num;
        }
        else{
            foreach ($chunkRecords as $record) {
                $values=null;
                $codiceProdotto='';
                $nomeFile='';
                $typoFile='';
                $isValidName=1;
                echo $record["id"].'<br>';
                /*$values = array_values($record);
                $filteredValues = array_filter($values, function ($value) {
                    return $value !== null && $value !== '';
                });
                
                // Se tutti i valori nella riga sono vuoti o null, considera la riga vuota
                if (empty($filteredValues)) {
                    $chunkData[]="Id: vuoto  Nome File: vuoto";
                    continue;
                }
                */
                $totalRecords++;
                
            }
            $nextPage=$page + 1;
            return $this->cycleCsv($csvFileName,$nextPage,$totalRecords);    
                    
        }
        
        
        
    }

}
