<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientproductrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('label');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientproductrules');
    }
}
