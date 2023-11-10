<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncSyncroTableBrand extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_syncro_table_brand', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('field_name')->nullable();
            $table->boolean('is_relation_with_product_table')->nullable();
            $table->integer('clientproductrules_id')->nullable();
            $table->integer('filedtype_id')->nullable();
            $table->boolean('is_primary_key')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_syncro_table_brand');
    }
}
