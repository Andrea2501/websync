<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class TablePropertyValues extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_syncro_table_property_values';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsTo=[
        'fieldtype'=>['Tecnotrade\Websync\Models\FieldType',
        'order'=>'type'
        ],
        'clientprovaluerules'=>['Tecnotrade\Websync\Models\ClientPropValueRules',
        'order'=>'label'
        ],
    ];

}
