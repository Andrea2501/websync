<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientPropvaluefieldPropvaluerule3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_client_propvaluefield_propvaluerule', function($table)
        {
            $table->dropPrimary(['client_propertyvalues_id','client_prop_value_rules_id']);
            $table->renameColumn('client_propertyvalues_id', 'client_prop_values_fields_id');
            $table->primary(['client_prop_values_fields_id','client_prop_value_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_client_propvaluefield_propvaluerule', function($table)
        {
            $table->dropPrimary(['client_prop_values_fields_id','client_prop_value_rules_id']);
            $table->renameColumn('client_prop_values_fields_id', 'client_propertyvalues_id');
            $table->primary(['client_propertyvalues_id','client_prop_value_rules_id']);
        });
    }
}
