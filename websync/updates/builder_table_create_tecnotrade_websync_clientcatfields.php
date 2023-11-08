<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientcatfields extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientcatfields', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('field_name')->nullable();
            $table->string('label')->nullable();
            $table->integer('order')->nullable();
            $table->integer('fieldtype_id');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientcatfields');
    }
}
