<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class TablePropertyGroups extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_syncro_table_property_groups';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsTo=[
        'fieldtype'=>['Tecnotrade\Websync\Models\FieldType',
        'order'=>'type'
        ],
       
        'clientpropertygroupsrules'=>['Tecnotrade\Websync\Models\ClientGroupPropRules',
        'order'=>'label'
        ],
    ];

}
