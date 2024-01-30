<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class ClientGroupPropRules extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_client_grouppropertyrules';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsToMany=[
        'grouppropfields'=>[
            'Tecnotrade\Websync\Models\ClientGroupPropFields',
            'table'=>'tecnotrade_websync_grouppropertiesfields_grouppropertyrules',
        ],
    ];

}
