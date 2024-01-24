<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class TableAdditionalProps extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_syncro_table_additional_props_fields';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsTo=[
        'fieldtype'=>['Tecnotrade\Websync\Models\FieldType',
        'order'=>'type'
        ],
        'additionalpropsrules'=>['Tecnotrade\Websync\Models\AdditionalPropsRules',
        'order'=>'label'
        ],
    ];
}
