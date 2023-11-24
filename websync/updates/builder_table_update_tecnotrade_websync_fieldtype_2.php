<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncFieldtype2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_fieldtype', function($table)
        {
            $table->dropColumn('is_numeric');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_fieldtype', function($table)
        {
            $table->boolean('is_numeric')->nullable()->default(0);
        });
    }
}
