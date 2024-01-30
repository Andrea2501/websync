<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class TablePropertyFields extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_syncro_table_props';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $belongsTo=[
        'fieldtype'=>['Tecnotrade\Websync\Models\FieldType',
        'order'=>'type'
        ],
       
        'clientproprules'=>['Tecnotrade\Websync\Models\ClientPropRules',
        'order'=>'label'
        ],
        'clientpropgrouprules'=>['Tecnotrade\Websync\Models\ClientGroupPropRules',
        'order'=>'label'
        ],
    ];

}
