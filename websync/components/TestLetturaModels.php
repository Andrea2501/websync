<?php namespace Tecnotrade\Websync\Components;

use Cms\Classes\ComponentBase;

class TestLetturaModel extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Visualizza Banner Ads',
            'description' => 'Componente per la visualizzazione dei banner escluso main e slider'
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
    }
}