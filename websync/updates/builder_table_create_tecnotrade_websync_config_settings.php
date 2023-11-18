<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncConfigSettings extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_config_settings', function($table)
        {
            $table->increments('id')->unsigned();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_config_settings');
    }
}
