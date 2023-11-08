<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientfields2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientfields', function($table)
        {
            $table->integer('fieldtype_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientfields', function($table)
        {
            $table->dropColumn('fieldtype_id');
        });
    }
}
