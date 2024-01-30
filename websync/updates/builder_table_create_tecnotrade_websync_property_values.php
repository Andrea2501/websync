<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncPropertyValues extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_property_values', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('product_code');
            $table->string('parent_product_code')->nullable();
            $table->string('property_code')->nullable();
            $table->string('property_name')->nullable();
            $table->string('property_index')->nullable();
            $table->integer('october_id')->nullable();
            $table->integer('property_october_id')->nullable();
            $table->integer('product_october_id')->nullable();
            $table->integer('product_variant_id')->nullable();
            $table->integer('import_status')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_property_values');
    }
}
