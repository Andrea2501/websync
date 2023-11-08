<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientbrandrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientbrandrules', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('rule_name')->nullable();
            $table->string('label')->nullable();
            $table->text('description')->nullable();
            $table->boolean('force_slug')->nullable();
            $table->string('elimina_da_mall_se_inizia_per')->nullable();
            $table->text('elimina_da_mall_se_uguale_a')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientbrandrules');
    }
}
