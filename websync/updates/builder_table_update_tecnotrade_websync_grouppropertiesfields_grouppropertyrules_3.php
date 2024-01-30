<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncGrouppropertiesfieldsGrouppropertyrules3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->dropPrimary(['client_grouppropertiesfields_id','client_grouppropertyrules_id']);
            $table->renameColumn('client_grouppropertiesfields_id', 'client_group_prop_fields_id');
            $table->primary(['client_group_prop_fields_id','client_grouppropertyrules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->dropPrimary(['client_group_prop_fields_id','client_grouppropertyrules_id']);
            $table->renameColumn('client_group_prop_fields_id', 'client_grouppropertiesfields_id');
            $table->primary(['client_grouppropertiesfields_id','client_grouppropertyrules_id']);
        });
    }
}
