<?php namespace Tecnotrade\Websync\Models;

use Model;

/**
 * Model
 */
class AdditionalPropsRules extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'tecnotrade_websync_clientadditionalpropsrules';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $belongsToMany=[
        'additionalpropsfields'=>[
            'Tecnotrade\Websync\Models\AdditionalPropsFields',
            'table'=>'tecnotrade_websync_client__addpropsfields_addpropsrules',
        ],
    ];
   

}
