<?php namespace Tecnotrade\Websync\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Model;

/**
 * Model
 */
class ClientFields extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_clientfields';

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
