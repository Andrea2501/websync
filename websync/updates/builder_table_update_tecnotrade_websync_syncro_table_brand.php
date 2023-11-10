<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableBrand extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_brand', function($table)
        {
            $table->integer('clientbrandrules_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_brand', function($table)
        {
            $table->dropColumn('clientbrandrules_id');
        });
    }
}
