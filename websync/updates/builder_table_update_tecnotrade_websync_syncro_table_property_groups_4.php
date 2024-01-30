<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTablePropertyGroups4 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_property_groups', function($table)
        {
            $table->integer('is_category_code')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_property_groups', function($table)
        {
            $table->dropColumn('is_category_code');
        });
    }
}
