<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableProps3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->integer('client_prop_rules_id')->nullable();
            $table->integer('client_group_prop_rules_id')->nullable();
            $table->renameColumn('is_realtion_with_property_group', 'is_relation_with_property_group');
            $table->dropColumn('clientproprules_id');
            $table->dropColumn('clientpropsgroup_id');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->dropColumn('client_prop_rules_id');
            $table->dropColumn('client_group_prop_rules_id');
            $table->renameColumn('is_relation_with_property_group', 'is_realtion_with_property_group');
            $table->integer('clientproprules_id')->nullable();
            $table->integer('clientpropsgroup_id')->nullable();
        });
    }
}
