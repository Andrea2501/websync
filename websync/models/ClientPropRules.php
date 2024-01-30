<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class ClientPropRules extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_proprules';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];
    public $belongsToMany=[
        'propfieldsrules'=>[
            'Tecnotrade\Websync\Models\ClientPropFields',
            'table'=>'tecnotrade_websync_propfields_proprules',
        ],
    ];

}
