<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncCategory4 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_category', function($table)
        {
            $table->boolean('visibility')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_category', function($table)
        {
            $table->dropColumn('visibility');
        });
    }
}
