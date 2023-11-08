<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientproductfieldsClientproductrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientproductfields_clientproductrules', function($table)
        {
            $table->integer('clientproductfields_id');
            $table->integer('clientproductrules_id');
            $table->integer('order')->default(0);
            $table->primary(['clientproductfields_id','clientproductrules_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientproductfields_clientproductrules');
    }
}
