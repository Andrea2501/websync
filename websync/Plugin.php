<?php namespace Tecnotrade\Websync;

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
        return [
            'Tecnotrade\Websync\Components\TestLetturaModel'=> 'TestLetturaModel',
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
}
