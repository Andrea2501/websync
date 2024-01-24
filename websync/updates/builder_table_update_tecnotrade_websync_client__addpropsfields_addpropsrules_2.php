<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientAddpropsfieldsAddpropsrules2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_client__addpropsfields_addpropsrules', function($table)
        {
            $table->dropPrimary(['additional_props_fields_id','addpropsrules_id']);
            $table->renameColumn('addpropsrules_id', 'additional_props_rules_id');
            $table->primary(['additional_props_fields_id','additional_props_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_client__addpropsfields_addpropsrules', function($table)
        {
            $table->dropPrimary(['additional_props_fields_id','additional_props_rules_id']);
            $table->renameColumn('additional_props_rules_id', 'addpropsrules_id');
            $table->primary(['additional_props_fields_id','addpropsrules_id']);
        });
    }
}
