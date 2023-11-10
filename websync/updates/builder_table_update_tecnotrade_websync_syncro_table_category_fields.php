<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableCategoryFields extends Migration
{
    public function up()
    {
        Schema::rename('tecnotrade_websync_syncro_table_category', 'tecnotrade_websync_syncro_table_category_fields');
    }
    
    public function down()
    {
        Schema::rename('tecnotrade_websync_syncro_table_category_fields', 'tecnotrade_websync_syncro_table_category');
    }
}
