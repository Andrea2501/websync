<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncGrouppropertiesfieldsGrouppropertyrules2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->dropPrimary(['client_group_prop_fields_id','clinet_group_prop_rules_id']);
            $table->integer('client_grouppropertiesfields_id');
            $table->integer('client_grouppropertyrules_id');
            $table->dropColumn('client_group_prop_fields_id');
            $table->dropColumn('clinet_group_prop_rules_id');
            $table->primary(['client_grouppropertiesfields_id','client_grouppropertyrules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->dropPrimary(['client_grouppropertiesfields_id','client_grouppropertyrules_id']);
            $table->dropColumn('client_grouppropertiesfields_id');
            $table->dropColumn('client_grouppropertyrules_id');
            $table->integer('client_group_prop_fields_id');
            $table->integer('clinet_group_prop_rules_id');
            $table->primary(['client_group_prop_fields_id','clinet_group_prop_rules_id']);
        });
    }
}
