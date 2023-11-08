<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class ClientCategoryRules extends Model
{
    use \October\Rain\Database\Traits\Validation;

    /**
     * @var bool timestamps are disabled.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;

    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_clientcatrules';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsToMany=[
        'clientcategoryfields'=>[
            'Tecnotrade\Websync\Models\ClientCategoryFields',
            'table'=>'tecnotrade_websync_clientcategoryfields_clientcategoryrules',
        ],
    ];

}
