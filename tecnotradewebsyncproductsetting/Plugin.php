<?php namespace Tecnotrade\Tecnotradewebsyncproductsetting;

use System\Classes\PluginBase;

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
    }

    /**
     * boot method, called right before the request route.
     */
    public function boot()
    {
    }

    /**
     * registerComponents used by the frontend.
     */
    public function registerComponents()
    {
    }

    /**
     * registerSettings used by the backend.
     */
    public function registerSettings()
    {
        return [
            'settings' => [
                'label' => 'Configurazioni Prodotti Sincro Web  ',
                'description' => 'Imposta i parametri per la sincronizzazione dei Prodotti.',
                'category' => 'Tecnotrade',
                'icon' => 'icon-cog',
                'class' => \Tecnotrade\Tecnotradewebsyncproductsetting\Models\ConfigSetting::class,
                'order' => 52,
                'keywords' => 'sincro syncro config tecnotrade',
                'permissions' => ['rainlab.users.access_settings']
                
            ],
            
        ];
    }
}
