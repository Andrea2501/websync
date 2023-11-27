<?php namespace Tecnotrade\TecnotradeWebsyncCategorySetting;

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
                'label' => 'Configurazioni Categorie Sincro Web  ',
                'description' => 'Imposta i parametri per la sincronizzazione delle categorie.',
                'category' => 'Tecnotrade',
                'icon' => 'icon-cog',
                'class' => \Tecnotrade\TecnotradeWebsyncCategorySetting\Models\ConfigSetting::class,
                'order' => 51,
                'keywords' => 'sincro syncro congig tecnotrade',
                'permissions' => ['rainlab.users.access_settings']
                
            ],
            
        ];
    }
}
