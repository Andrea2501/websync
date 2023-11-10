<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableProductFields2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_product_fields', function($table)
        {
            $table->boolean('is_primary_key')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_product_fields', function($table)
        {
            $table->dropColumn('is_primary_key');
        });
    }
}
