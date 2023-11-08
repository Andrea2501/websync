<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class TableProductFields extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_syncro_table_product_fields';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

}
