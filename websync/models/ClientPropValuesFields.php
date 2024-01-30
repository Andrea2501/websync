<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class ClientPropValuesFields extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_client_propertyvaluesfields';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsTo=[
        'fieldtype'=>['Tecnotrade\Websync\Models\FieldType',
        'order'=>'type'
        ],
    ];

}
