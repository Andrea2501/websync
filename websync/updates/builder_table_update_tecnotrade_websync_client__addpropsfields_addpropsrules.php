<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientAddpropsfieldsAddpropsrules extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_client__addpropsfields_addpropsrules', function($table)
        {
            $table->dropPrimary(['addpropsfields_id','addpropsrules_id']);
            $table->renameColumn('addpropsfields_id', 'additional_props_fields_id');
            $table->primary(['additional_props_fields_id','addpropsrules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_client__addpropsfields_addpropsrules', function($table)
        {
            $table->dropPrimary(['additional_props_fields_id','addpropsrules_id']);
            $table->renameColumn('additional_props_fields_id', 'addpropsfields_id');
            $table->primary(['addpropsfields_id','addpropsrules_id']);
        });
    }
}
