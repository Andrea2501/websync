<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductrules4 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->string('rule_name');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->dropColumn('rule_name');
        });
    }
}
