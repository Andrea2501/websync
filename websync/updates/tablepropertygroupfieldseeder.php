<?php namespace Tecnotrade\Websync\Updates;

use OFFLINE\Mall\Models\PropertyGroup;
use Seeder;
use Tecnotrade\Websync\Models\TablePropertyGroups as PropertyGroupFields;

class TablePropertyGroupFieldSeeder extends Seeder
{
    public function run()
    {
        PropertyGroupFields::truncate();


        $field =PropertyGroupFields::create([
            'field_name' => 'name',
            'is_primary_key'=>'0',  
            'fieldtype_id'=>'2'  
        
        ]);
        $field = PropertyGroupFields::create([
            'field_name' => 'code',
            'is_primary_key'=>'1',
            'fieldtype_id'=>'2'
        ]);

        $field = PropertyGroupFields::create([
            'field_name' => 'display_name',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
        ]);
        $field = PropertyGroupFields::create([
            'field_name' => 'slug',
            'is_slug'=>'1',
            'fieldtype_id'=>'1'
        ]);

        $field = PropertyGroupFields::create([
            'field_name' => 'description',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'4'
        ]);
        
        $field = PropertyGroupFields::create([
            'field_name' => 'updated_at',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'7'
            
        ]);
        
       
    }
}