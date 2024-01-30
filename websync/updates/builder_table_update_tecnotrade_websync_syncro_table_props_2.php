<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableProps2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->renameColumn('clinetpropsgroup_id', 'clientpropsgroup_id');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->renameColumn('clientpropsgroup_id', 'clinetpropsgroup_id');
        });
    }
}
