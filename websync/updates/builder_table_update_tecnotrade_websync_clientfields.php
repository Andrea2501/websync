<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientfields extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientfields', function($table)
        {
            $table->string('label')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientfields', function($table)
        {
            $table->dropColumn('label');
        });
    }
}
