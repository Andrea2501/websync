<?php namespace Tecnotrade\Websync\Updates;
use Seeder;
use Tecnotrade\Websync\Models\TablePropertyValues as PropertFields;

class TablePropertyValueFieldSeeder extends Seeder
{
    public function run()
    {
        PropertFields::truncate();


        $field = PropertFields::create([
            'field_name' => 'product_code',
            'is_product_code'=>'1',
            'fieldtype_id'=>'2'
        ]);
        $field = PropertFields::create([
            'field_name' => 'father_product_code',
            'is_parent_product_code'=>'1',
            'fieldtype_id'=>'2'
        ]);
        $field = PropertFields::create([
            'field_name' => 'property_code',
            'fieldtype_id'=>'2'
        ]);
        
        $field = PropertFields::create([
            'field_name' => 'property_name',
            'fieldtype_id'=>'2',
            'is_property_name'=>'1',
        ]);
        $field = PropertFields::create([
            'field_name' => 'property_value',
            'fieldtype_id'=>'2',
            'is_property_value'=>'1',
        ]);
        $field = PropertFields::create([
            'field_name' => 'index_value',
            'fieldtype_id'=>'2',
        ]);
    
        $field = PropertFields::create([
            'field_name' => 'updated_at',
            'is_data_update'=>'1',
            'fieldtype_id'=>'7'
            
        ]);
        

    }
}