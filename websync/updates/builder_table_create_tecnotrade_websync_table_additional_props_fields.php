<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncTableAdditionalPropsFields extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_table_additional_props_fields', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('field_name')->nullable();
            $table->boolean('is_relation_with_product_table')->nullable();
            $table->integer('clientadditonalpropsrules_id')->nullable();
            $table->integer('filedtype_id')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_table_additional_props_fields');
    }
}
