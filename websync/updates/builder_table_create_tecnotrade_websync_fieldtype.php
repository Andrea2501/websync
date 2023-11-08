<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncFieldtype extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_fieldtype', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('type')->nullable();
            $table->string('code')->nullable();
            $table->bigInteger('max_length')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_fieldtype');
    }
}
