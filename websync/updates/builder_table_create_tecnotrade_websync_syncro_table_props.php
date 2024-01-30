<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncSyncroTableProps extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_syncro_table_props', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('field_name');
            $table->boolean('is_realtion_with_property_group');
            $table->integer('clientproprules_id');
            $table->integer('fieldtype_id');
            $table->boolean('is_primary_key');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_syncro_table_props');
    }
}
