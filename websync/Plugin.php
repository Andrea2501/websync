<?php namespace Tecnotrade\Websync;

use System\Classes\PluginBase;
use OFFLINE\Mall\Models\Brand as BrandModel;
use OFFLINE\Mall\Controllers\Brands as BrandController;
/**
 * Plugin class
 */
class Plugin extends PluginBase
{
    /**
     * register method, called when the plugin is first registered.
     */
    public function register()
    {
        $this->registerConsoleCommand('websinc.initsincro', \Tecnotrade\Websync\Console\InitSincro::class);
    
    }

    /**
     * boot method, called right before the request route.
     */
    public function boot()
    {
        $this->addSlugAndCodeToBrand();
    }

    /**
     * registerComponents used by the frontend.
     */
    public function registerComponents()
    {
        return [
            'Tecnotrade\Websync\Components\TestLetturaModel'=> 'TestLetturaModel',
            'Tecnotrade\Websync\Components\TestLetturaCategory'=> 'TestLetturaCategory',
            'Tecnotrade\Websync\Components\TestLetturaBrand'=> 'TestLetturaBrand',
            'Tecnotrade\Websync\Components\CategoryToMall'=> 'CategoryToMall',
            'Tecnotrade\Websync\Components\BrandsToMall'=> 'BrandsToMall',
            'Tecnotrade\Websync\Components\ProductToMall'=> 'ProductToMall',
            'Tecnotrade\Websync\Components\CsvTester'=> 'CsvTester',
            'Tecnotrade\Websync\Components\CsvTestLetturaCategory'=> 'CsvTestLetturaCategory',
        ];
    }

    /**
     * registerSettings used by the backend.
     */
    public function registerSettings()
    {
        return [
            'settings' => [
                'label' => 'Configurazioni Sincro Web  ',
                'description' => 'Imposta i parametri per la sincto.',
                'category' => 'Tecnotrade',
                'icon' => 'icon-cog',
                'class' => \Tecnotrade\Websync\Models\ConfigSetting::class,
                'order' => 50,
                'keywords' => 'sincro syncro congig tecnotrade',
                'permissions' => ['rainlab.users.access_settings']
                
            ],
            
        ];
    }
    public function addSlugAndCodeToBrand(){
        BrandController::extendFormFields(function($form, $model, $context) {
            if (!$model instanceof BrandModel) {
                return;
            }
            $form->addTabFields([
                'code'=>[
                       'label' => 'Code',
                        'type' => 'text',
                        'span' => 'left',
                        'tab'=> 'offline.mall::lang.product.general',
                        
                                   
                ],
                'slug'=>[
                    'label' => 'slug',
                     'type' => 'text',
                     'span' => 'left',
                     'tab'=> 'offline.mall::lang.product.general',
                     
                                
                ],
                
            ]);
        });
        BrandController::extendListColumns(function($list, $model){
            if (!$model instanceof BrandModel) {
                return;
            }
            $list->addColumns([

                'code'=>[
                    'label' => 'Code',
                    'type' => 'text',
                    'sortable' => true,
                    'invisible' => false,
                    'searchable'=>true,
                ],
                'slug' => [
                    'label' => 'Slug',
                    'type' => 'text',
                    'sortable' => true,
                    'invisible' => false,
                    'searchable'=>true,
                ],
            ]);
        
        });
    }
}
