<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class CategoryPropertyGroup extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_category_property_group';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

}
