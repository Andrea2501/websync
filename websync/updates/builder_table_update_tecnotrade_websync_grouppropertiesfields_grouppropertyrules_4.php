<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncGrouppropertiesfieldsGrouppropertyrules4 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->dropPrimary(['client_group_prop_fields_id','client_grouppropertyrules_id']);
            $table->renameColumn('client_grouppropertyrules_id', 'client_group_prop_rules_id');
            $table->primary(['client_group_prop_fields_id','client_group_prop_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->dropPrimary(['client_group_prop_fields_id','client_group_prop_rules_id']);
            $table->renameColumn('client_group_prop_rules_id', 'client_grouppropertyrules_id');
            $table->primary(['client_group_prop_fields_id','client_grouppropertyrules_id']);
        });
    }
}
