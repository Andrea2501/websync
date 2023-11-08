<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientfields extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientfields', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('name')->nullable();
            $table->integer('position_in_csv')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientfields');
    }
}
