<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableCategoryFields2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_category_fields', function($table)
        {
            $table->integer('fieldtype_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_category_fields', function($table)
        {
            $table->dropColumn('fieldtype_id');
        });
    }
}
