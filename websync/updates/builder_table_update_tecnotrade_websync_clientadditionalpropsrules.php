<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientadditionalpropsrules extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientadditionalpropsrules', function($table)
        {
            $table->boolean('is_prop_order')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientadditionalpropsrules', function($table)
        {
            $table->dropColumn('is_prop_order');
        });
    }
}
