<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableBrandFields extends Migration
{
    public function up()
    {
        Schema::rename('tecnotrade_websync_syncro_table_brand', 'tecnotrade_websync_syncro_table_brand_fields');
    }
    
    public function down()
    {
        Schema::rename('tecnotrade_websync_syncro_table_brand_fields', 'tecnotrade_websync_syncro_table_brand');
    }
}
