<?php namespace Tecnotrade\Websync\Updates;
use Seeder;
use Tecnotrade\Websync\Models\TableBrandFields as BrandFields;

class FieldTypeSeeded extends Seeder
{
    public function run()
    {
        BrandFields::truncate();


        $field = BrandFields::create([
            'field_name' => 'brand_name',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
        ]);

        $field = BrandFields::create([
            'field_name' => 'slug',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'1'
        ]);
        $field = BrandFields::create([
            'field_name' => 'brand_code',
            'is_primary_key'=>'1',
            'fieldtype_id'=>'2'
        ]);
        $field = BrandFields::create([
            'field_name' => 'description',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'4'
        ]);
        $field = BrandFields::create([
            'field_name' => 'website',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
        ]);
        $field = BrandFields::create([
            'field_name' => 'update_at',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'7'
            
        ]);

    }
}