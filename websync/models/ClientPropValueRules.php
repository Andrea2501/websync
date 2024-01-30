<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class ClientPropValueRules extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_clientpropvaluerules';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsToMany=[
        'clientpropvaluesfields'=>[
            'Tecnotrade\Websync\Models\ClientPropValuesFields',
            'table'=>'tecnotrade_websync_client_propvaluefield_propvaluerule',
        ],
    ];

}
