<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientPropvaluefieldPropvaluerule extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_client_propvaluefield_propvaluerule', function($table)
        {
            $table->integer('client_propertyvalues_id');
            $table->integer('clientprovaluesrules_id');
            $table->primary(['client_propertyvalues_id','clientprovaluesrules_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_client_propvaluefield_propvaluerule');
    }
}
