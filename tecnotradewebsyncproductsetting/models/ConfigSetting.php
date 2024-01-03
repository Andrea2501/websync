<?php namespace Tecnotrade\Tecnotradewebsyncproductsetting\Models;

use Model;

/**
 * Model
 */
class ConfigSetting extends Model
{
    use \October\Rain\Database\Traits\Validation;

    /**
     * @var bool timestamps are disabled.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;
    use \October\Rain\Database\Traits\Validation;
    public $implement = [
        \System\Behaviors\SettingsModel::class
    ];

    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_tecnotradewebsyncproductsetting_configsetting';
   
    public $settingsCode = 'tecnotrade_websync_productsettings';
    public $settingsFields = 'fields.yaml';
    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

}
