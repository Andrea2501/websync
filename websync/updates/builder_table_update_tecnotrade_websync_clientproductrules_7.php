<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductrules7 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->boolean('is_slug')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->dropColumn('is_slug');
        });
    }
}
