<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductrules3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->string('force_slug', 191)->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->dropColumn('force_slug');
        });
    }
}
