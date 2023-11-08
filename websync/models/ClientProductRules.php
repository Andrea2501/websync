<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class ClientProductRules extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_clientproductrules';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $belongsToMany=[
        'clientproductfields'=>[
            'Tecnotrade\Websync\Models\ClientProductFields',
            'table'=>'tecnotrade_websync_clientproductfields_clientproductrules',
        ],
    ];

}
