<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTablePropertyValues extends Migration
{
    public function up()
    {
        Schema::rename('tecnotrade_websync_syncro_table_property', 'tecnotrade_websync_syncro_table_property_values');
    }
    
    public function down()
    {
        Schema::rename('tecnotrade_websync_syncro_table_property_values', 'tecnotrade_websync_syncro_table_property');
    }
}
