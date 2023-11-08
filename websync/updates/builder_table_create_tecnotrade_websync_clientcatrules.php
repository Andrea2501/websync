<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientcatrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('rule_name')->nullable();
            $table->string('label')->nullable();
            $table->string('description')->nullable();
            $table->boolean('force_slug')->nullable();
            $table->boolean('is_root')->nullable();
            $table->boolean('is_child')->nullable();
            $table->string('elimina_da_mall_se_contiene')->nullable();
            $table->string('elimina_da_mall_se_uguale_a');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientcatrules');
    }
}
