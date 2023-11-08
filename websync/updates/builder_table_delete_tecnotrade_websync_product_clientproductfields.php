<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableDeleteTecnotradeWebsyncProductClientproductfields extends Migration
{
    public function up()
    {
        Schema::dropIfExists('tecnotrade_websync_product_clientproductfields');
    }
    
    public function down()
    {
        Schema::create('tecnotrade_websync_product_clientproductfields', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('name', 255);
            $table->integer('position_in_source')->nullable();
            $table->string('label', 255)->nullable();
            $table->integer('fieldtype_id')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
}
