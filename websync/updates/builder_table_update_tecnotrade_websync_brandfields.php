<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncBrandfields extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_brandfields', function($table)
        {
            $table->integer('fieldtype_id')->default(1)->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_brandfields', function($table)
        {
            $table->integer('fieldtype_id')->default(null)->change();
        });
    }
}
