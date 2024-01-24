<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableAdditionalPropsFields2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_additional_props_fields', function($table)
        {
            $table->renameColumn('filedtype_id', 'fieldtype_id');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_additional_props_fields', function($table)
        {
            $table->renameColumn('fieldtype_id', 'filedtype_id');
        });
    }
}
