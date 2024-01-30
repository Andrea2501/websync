<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTablePropertyGroups3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_property_groups', function($table)
        {
            $table->dropColumn('is_relation_field_with_categories');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_property_groups', function($table)
        {
            $table->boolean('is_relation_field_with_categories')->nullable();
        });
    }
}
