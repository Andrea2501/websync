<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableAdditionalPropsFields4 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_additional_props_fields', function($table)
        {
            $table->renameColumn('is_relation_with_product_table', 'is_product_code');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_additional_props_fields', function($table)
        {
            $table->renameColumn('is_product_code', 'is_relation_with_product_table');
        });
    }
}
