<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class TableBrandFields extends Model
{
    use \October\Rain\Database\Traits\Validation;

    /**
     * @var bool timestamps are disabled.
     * Remove this line if timestamps are defined in the database table.
     */
    
    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_syncro_table_brand_fields';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsTo=[
        'fieldtype'=>['Tecnotrade\Websync\Models\FieldType',
        'order'=>'type'
        ],
        'clientbrandrules'=>['Tecnotrade\Websync\Models\ClientBrandRules',
        'order'=>'label'
        ],
        'clientproductrules'=>['Tecnotrade\Websync\Models\ClientProductRules',
        'order'=>'label'
        ],
    ];

}
