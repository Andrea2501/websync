<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableProps4 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->renameColumn('client_group_prop_rules_id', 'clientpropertygroupsrules_id');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->renameColumn('clientpropertygroupsrules_id', 'client_group_prop_rules_id');
        });
    }
}
