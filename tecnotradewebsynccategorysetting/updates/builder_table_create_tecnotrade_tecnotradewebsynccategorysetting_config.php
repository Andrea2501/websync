<?php namespace Tecnotrade\TecnotradeWebsyncCategorySetting\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeTecnotradewebsynccategorysettingConfig extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_tecnotradewebsynccategorysetting_config', function($table)
        {
            $table->increments('id')->unsigned();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->text('settings');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_tecnotradewebsynccategorysetting_config');
    }
}
