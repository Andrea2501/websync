<?php namespace Tecnotrade\Websync\Updates;

use OFFLINE\Mall\Models\PropertyGroup;
use Seeder;
use Tecnotrade\Websync\Models\TableAdditionalProps as AdditionalFields;

class TableAdditionalPropsFieldsSeeder extends Seeder
{
    public function run()
    {
        AdditionalFields::truncate();


        $field =AdditionalFields::create([
            'field_name' => 'name',
            'is_primary_key'=>'0',  
            'fieldtype_id'=>'2'  
        
        ]);
        $field = AdditionalFields::create([
            'field_name' => 'value',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
        ]);

        $field = AdditionalFields::create([
            'field_name' => 'code',
            'is_primary_key'=>'1',
            'fieldtype_id'=>'2'
        ]);
        
        $field = AdditionalFields::create([
            'field_name' => 'product_code',
            'is_product_code'=>'1',
            'fieldtype_id'=>'2'
        ]);
        $field = AdditionalFields::create([
            'field_name' => 'updated_at',
            'is_data_update'=>'1',
            'fieldtype_id'=>'7'
            
        ]);
        
       
    }
}