<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTablePropertyGroups extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_property_groups', function($table)
        {
            $table->renameColumn('client_grouppropertyrules_id', 'client_group_prop_rules_id');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_property_groups', function($table)
        {
            $table->renameColumn('client_group_prop_rules_id', 'client_grouppropertyrules_id');
        });
    }
}
