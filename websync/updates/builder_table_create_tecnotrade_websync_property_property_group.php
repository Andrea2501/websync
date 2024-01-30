<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncPropertyPropertyGroup extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_property_property_group', function($table)
        {
            $table->increments('id')->unsigned();
            $table->integer('october_id_property_group')->nullable();
            $table->integer('october_id_property')->nullable();
            $table->boolean('use_for_variant')->nullable();
            $table->string('filter_type')->nullable();
            $table->integer('sorte_order')->nullable();
            $table->integer('import_status')->nullable();
            $table->string('property_group_code')->nullable();
            $table->string('property_code')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_property_property_group');
    }
}
