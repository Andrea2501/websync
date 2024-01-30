<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncGrouppropertiesfieldsGrouppropertyrules extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->dropPrimary(['id_group_properties_fields','id_group_property_rules']);
            $table->integer('client_group_prop_fields_id');
            $table->integer('clinet_group_prop_rules_id');
            $table->dropColumn('id_group_properties_fields');
            $table->dropColumn('id_group_property_rules');
            $table->primary(['client_group_prop_fields_id','clinet_group_prop_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->dropPrimary(['client_group_prop_fields_id','clinet_group_prop_rules_id']);
            $table->dropColumn('client_group_prop_fields_id');
            $table->dropColumn('clinet_group_prop_rules_id');
            $table->integer('id_group_properties_fields');
            $table->integer('id_group_property_rules');
            $table->primary(['id_group_properties_fields','id_group_property_rules']);
        });
    }
}
