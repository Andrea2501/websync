<?php namespace Tecnotrade\Websync\Updates;
use Seeder;
use Tecnotrade\Websync\Models\FieldType as FieldType;

class FieldTypeSeeded extends Seeder
{
    public function run()
    {
        FieldType::truncate();


        $field = FieldType::create([
            'type' => 'varchar (191)',
            'code' => 'varchat-191',
            'max_length' => '191',
            
        ]);
        $field = FieldType::create([
            'type' => 'varchar (255)',
            'code' => 'varchat-255',
            'max_length' => '255',
            
        ]);
        $field = FieldType::create([
            'type' => 'Int (11)',
            'code' => 'int',
            'max_length' => '11',
            
        ]);
        $field = FieldType::create([
            'type' => 'Text (65535)',
            'code' => 'txt-65535',
            'max_length' => '65535',
            
        ]);
        $field = FieldType::create([
            'type' => 'Text (max)',
            'code' => 'txt-max',
            'max_length' => '-1',
            
        ]);
        $field = FieldType::create([
            'type' => 'Boolean (0/1)',
            'code' => 'bool',
            'max_length' => '1',
            
        ]);
        $field = FieldType::create([
            'type' => 'Date Time Utc (Y-m-d H:i:s)',
            'code' => 'dttm-utc',
            'max_length' => '18',
            
        ]);
        $field = FieldType::create([
            'type' => 'Date Utc (Y-m-d)',
            'code' => 'dt-utc',
            'max_length' => '10',
            
        ]);
        $field = FieldType::create([
            'type' => 'Timestamp (numero secondi dal 01/01/1970)',
            'code' => 'tstamp',
            'max_length' => '-1',
            
        ]);
        $field = FieldType::create([
            'type' => 'Decimal (10,2)',
            'code' => 'decimal-102',
            'max_length' => '12',
            
        ]);
        $field = FieldType::create([
            'type' => 'Decimal (10,3)',
            'code' => 'decimal-103',
            'max_length' => '13',
            
        ]);
        $field = FieldType::create([
            'type' => 'Blob (binary - per immagini base64)',
            'code' => 'blob',
            'max_length' => '-1',
            
        ]);
        $field = FieldType::create([
            'type' => 'Float',
            'code' => 'float',
            'max_length' => '-1',
            
        ]);
    }
}