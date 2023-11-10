<?php namespace Tecnotrade\Websync\Updates;
use Seeder;
use Tecnotrade\Websync\Models\TableCategoryFields as CategoryFields;

class TableCategoryFieldSeeder extends Seeder
{
    public function run()
    {
        CategoryFields::truncate();


        $field = CategoryFields::create([
            'field_name' => 'name',
            'is_primary_key'=>'0',  
            'fieldtype_id'=>'2'  
        
        ]);
        $field = CategoryFields::create([
            'field_name' => 'code',
            'is_primary_key'=>'1',
            'fieldtype_id'=>'2'
        ]);

        $field = CategoryFields::create([
            'field_name' => 'slug',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'1'
        ]);
        $field = CategoryFields::create([
            'field_name' => 'meta_title',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
        ]);

        $field = CategoryFields::create([
            'field_name' => 'meta_description',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'4'
        ]);

        $field = CategoryFields::create([
            'field_name' => 'description',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'4'
        ]);

        $field = CategoryFields::create([
            'field_name' => 'description_short',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'4'
        ]);
        $field = CategoryFields::create([
            'field_name' => 'parent_code',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
        ]);
        $field = CategoryFields::create([
            'field_name' => 'level',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'3'
        ]);
       
    }
}