<?php namespace Tecnotrade\Websync\Updates;
use Seeder;
use Tecnotrade\Websync\Models\TableProductFields as ProductFields;

class TableProductFieldSeeder extends Seeder
{
    public function run()
    {
        ProductFields::truncate();


        $field = ProductFields::create([
            'field_name' => 'product_name',
            'is_primary_key'=>'0',  
            'fieldtype_id'=>'2'  
        
        ]);
        $field = ProductFields::create([
            'field_name' => 'codice_interno_univoco',
            'is_primary_key'=>'1',
            'fieldtype_id'=>'2'
        ]);
        $field = ProductFields::create([
            'field_name' => 'brand_code',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'category_code',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'            
        ]);
        
        $field = ProductFields::create([
            'field_name' => 'excerpt',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'4'
        ]);
        $field = ProductFields::create([
            'field_name' => 'description',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'4'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'extended_description',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'5'
            
        ]);

        $field = ProductFields::create([
            'field_name' => 'meta_title',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
        ]);
        $field = ProductFields::create([
            'field_name' => 'meta_description',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'4'
            
        ]);

        $field = ProductFields::create([
            'field_name' => 'qty_in_stock_int',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'3'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'qty_in_stock_double',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'13'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'inventory_management_method',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'12'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'allow_out_of_stock_purchase',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'6'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'stackable',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'6'
        ]);

        $field = ProductFields::create([
            'field_name' => 'shippable',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'6'
            
        ]);
        

        $field = ProductFields::create([
            'field_name' => 'price_included_taxes',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'6'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'price',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'10'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'mpn',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'gtin',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'2'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'original_slug',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'1'
            
        ]);
        $field = ProductFields::create([
            'field_name' => 'update_at',
            'is_primary_key'=>'0',
            'fieldtype_id'=>'7'
            
        ]);
    }
}