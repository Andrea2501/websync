<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableAdditionalPropsFields5 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_additional_props_fields', function($table)
        {
            $table->boolean('is_data_update')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_additional_props_fields', function($table)
        {
            $table->dropColumn('is_data_update');
        });
    }
}
