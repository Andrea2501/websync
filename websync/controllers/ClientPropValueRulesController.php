<?php namespace Tecnotrade\Websync\Controllers;

use Backend;
use BackendMenu;
use Backend\Classes\Controller;

class ClientPropValueRulesController extends Controller
{
    public $implement = [
        \Backend\Behaviors\FormController::class,
        \Backend\Behaviors\ListController::class,
        \Backend\Behaviors\RelationController::class
        
    ];

    public $formConfig = 'config_form.yaml';
    public $listConfig = 'config_list.yaml';
    public $relationConfig ='config_relation.yaml';

    public function __construct()
    {
        parent::__construct();
    }

}
