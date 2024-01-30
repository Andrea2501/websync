<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientGrouppropertyrules2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_client_grouppropertyrules', function($table)
        {
            $table->dropColumn('is_property_name');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_client_grouppropertyrules', function($table)
        {
            $table->boolean('is_property_name')->nullable();
        });
    }
}
