<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class SupportBrandTable extends Model
{
    use \October\Rain\Database\Traits\Validation;
    use \October\Rain\Database\Traits\Sluggable;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_brand';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    protected $slugs = ['slug' => 'brand_name'];


}
