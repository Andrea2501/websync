<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncSyncroTableProperty extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_syncro_table_property', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('field_name')->nullable();
            $table->boolean('is_primary_key')->nullable();
            $table->boolean('is_property_value')->nullable();
            $table->boolean('is_data_update')->nullable();
            $table->integer('fieldtype_id')->nullable();
            $table->integer('client_prop_value_rules_id')->nullable();
            $table->integer('is_product_code')->nullable();
            $table->integer('is_parent_product_code')->nullable();
            $table->integer('is_property_name')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_syncro_table_property');
    }
}
