<?php namespace Tecnotrade\Tecnotradewebsyncproductsetting\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeTecnotradewebsyncproductsettingConfigsetting extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_tecnotradewebsyncproductsetting_configsetting', function($table)
        {
            $table->increments('id')->unsigned();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_tecnotradewebsyncproductsetting_configsetting');
    }
}
