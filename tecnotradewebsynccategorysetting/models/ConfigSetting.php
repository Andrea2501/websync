<?php namespace Tecnotrade\TecnotradeWebsyncCategorySetting\Models;

use Model;

/**
 * Model
 */
class ConfigSetting extends Model
{
    use \October\Rain\Database\Traits\Validation;
    public $implement = [
        \System\Behaviors\SettingsModel::class
    ];



    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_tecnotradewebsynccategorysetting_config';
    public $settingsCode = 'tecnotrade_websync_categorysettings';
    public $settingsFields = 'fields.yaml';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

}

