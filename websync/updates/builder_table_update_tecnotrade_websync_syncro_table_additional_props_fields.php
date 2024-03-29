<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableAdditionalPropsFields extends Migration
{
    public function up()
    {
        Schema::rename('tecnotrade_websync_table_additional_props_fields', 'tecnotrade_websync_syncro_table_additional_props_fields');
    }
    
    public function down()
    {
        Schema::rename('tecnotrade_websync_syncro_table_additional_props_fields', 'tecnotrade_websync_table_additional_props_fields');
    }
}
