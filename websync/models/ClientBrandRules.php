<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class ClientBrandRules extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_clientbrandrules';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $belongsToMany=[
        'clientbrandfields'=>[
            'Tecnotrade\Websync\Models\ClientBrandFields',
            'table'=>'tecnotrade_websync_clientbrandfields_clientbrandrules',
        ],
    ];

}
