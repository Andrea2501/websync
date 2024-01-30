<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncSyncroTablePropertyGroups extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_syncro_table_property_groups', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('field_name')->nullable();
            $table->boolean('is_relation_field_with_categories')->nullable();
            $table->integer('client_grouppropertyrules_id')->nullable();
            $table->boolean('is_primary_key')->nullable();
            $table->integer('fieldtype_id')->nullable();
            $table->boolean('is_slug')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_syncro_table_property_groups');
    }
}
