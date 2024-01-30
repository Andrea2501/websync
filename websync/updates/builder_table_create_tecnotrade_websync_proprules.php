<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncProprules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_proprules', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('rule_name')->nullable();
            $table->string('label')->nullable();
            $table->text('description')->nullable();
            $table->boolean('is_primary_key')->nullable();
            $table->boolean('is_property_group_code')->nullable();
            $table->boolean('is_prop_type')->nullable();
            $table->boolean('is_slug')->nullable();
            $table->boolean('is_data_update')->nullable();
            $table->boolean('is_measure_unit');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_proprules');
    }
}
