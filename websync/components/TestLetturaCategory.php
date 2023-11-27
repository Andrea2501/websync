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
use Tecnotrade\TecnotradeWebsyncCategorySetting\Models\ConfigSetting as CatConfigSetting;
use Exception;

use Carbon\Carbon;




class TestLetturaCategory extends ComponentBase
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
            1: 'Sono tutte categorie di Root: level 0'
            2: 'Il livello verrà importato dal binding diretto del campo livello'
            3: 'Il livello verrà calcolato in base alla lunghezza del codice di categoria'
            4: 'Cerca di calcolare i livelli automaticamente'
        
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

}