<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class SupportPropertyValues extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_property_values';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

}
