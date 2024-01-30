<?php namespace Tecnotrade\Websync\Updates;

use OFFLINE\Mall\Models\PropertyGroup;
use Seeder;
use Tecnotrade\Websync\Models\TablePropertyFields as PropertyFields;

class TablePropertiesFieldSeeder extends Seeder
{
    public function run()
    {
        PropertyFields::truncate();


        $field =PropertyFields::create([
            'field_name' => 'name',
            'is_primary_key'=>'0',  
            'fieldtype_id'=>'2'  
        
        ]);
        $field =PropertyFields::create([
            'field_name' => 'unit',
            'is_primary_key'=>'0',  
            'fieldtype_id'=>'1'  
        
        ]);
        $field = PropertyFields::create([
            'field_name' => 'code',
            'is_primary_key'=>'1',
            'fieldtype_id'=>'2'
        ]);

        
        $field = PropertyFields::create([
            'field_name' => 'slug',
            'is_slug'=>'1',
            'fieldtype_id'=>'1'
        ]);

        $field = PropertyFields::create([
            'field_name' => 'property_group_code',
            'fieldtype_id'=>'2'
        ]);
        $field = PropertyFields::create([
            'field_name' => 'property_type',
            'fieldtype_id'=>'2'
        ]);
        $field = PropertyFields::create([
            'field_name' => 'filter_type',
            'fieldtype_id'=>'2'
        ]);
        $field = PropertyFields::create([
            'field_name' => 'use_for_variant',
            'fieldtype_id'=>'6'
        ]);
        
        $field = PropertyFields::create([
            'field_name' => 'updated_at',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'7'
            
        ]);
        
       
    }
}