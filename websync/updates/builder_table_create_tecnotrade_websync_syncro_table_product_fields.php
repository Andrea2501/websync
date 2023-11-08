<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncSyncroTableProductFields extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_syncro_table_product_fields', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('field_name')->nullable();
            $table->boolean('nullable')->nullable();
            $table->boolean('is_relation_field_with_brand_table')->nullable();
            $table->integer('brand_field_relation_rule_name')->nullable();
            $table->boolean('is_relation_field_with_category_table')->nullable();
            $table->integer('category_field_relation_rule_name')->nullable();
            $table->integer('fieldtype_id')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->integer('clientproductrules_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_syncro_table_product_fields');
    }
}
