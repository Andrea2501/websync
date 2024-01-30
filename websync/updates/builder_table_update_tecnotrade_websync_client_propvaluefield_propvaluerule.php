<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientPropvaluefieldPropvaluerule extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_client_propvaluefield_propvaluerule', function($table)
        {
            $table->dropPrimary(['client_propertyvalues_id','clientprovaluesrules_id']);
            $table->renameColumn('clientprovaluesrules_id', 'client_provalues_rules_id');
            $table->primary(['client_propertyvalues_id','client_provalues_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_client_propvaluefield_propvaluerule', function($table)
        {
            $table->dropPrimary(['client_propertyvalues_id','client_provalues_rules_id']);
            $table->renameColumn('client_provalues_rules_id', 'clientprovaluesrules_id');
            $table->primary(['client_propertyvalues_id','clientprovaluesrules_id']);
        });
    }
}
