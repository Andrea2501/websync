<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class ConfigSetting extends Model
{
    use \October\Rain\Database\Traits\Validation;
    use \October\Rain\Database\Traits\Validation;
    public $implement = [
        \System\Behaviors\SettingsModel::class
    ];


    /**
     * @var bool timestamps are disabled.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;

    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_config_settings';
    public $settingsCode = 'tecnotrade_websync_generalsettings';

    public $settingsFields = 'fields.yaml';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

}
