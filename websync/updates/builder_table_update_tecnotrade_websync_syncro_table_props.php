<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableProps extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->integer('clinetpropsgroup_id')->nullable();
            $table->string('field_name', 255)->nullable()->change();
            $table->boolean('is_realtion_with_property_group')->nullable()->change();
            $table->integer('clientproprules_id')->nullable()->change();
            $table->integer('fieldtype_id')->nullable()->change();
            $table->boolean('is_primary_key')->nullable()->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->dropColumn('clinetpropsgroup_id');
            $table->string('field_name', 255)->nullable(false)->change();
            $table->boolean('is_realtion_with_property_group')->nullable(false)->change();
            $table->integer('clientproprules_id')->nullable(false)->change();
            $table->integer('fieldtype_id')->nullable(false)->change();
            $table->boolean('is_primary_key')->nullable(false)->change();
        });
    }
}
