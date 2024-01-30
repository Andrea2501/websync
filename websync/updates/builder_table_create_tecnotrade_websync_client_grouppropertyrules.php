<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientGrouppropertyrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_client_grouppropertyrules', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('rule_name')->nullable();
            $table->string('label')->nullable();
            $table->string('description')->nullable();
            $table->boolean('is_slug')->nullable();
            $table->boolean('is_property_name')->nullable();
            $table->boolean('is_primary_key')->nullable();
            $table->string('is_data_update')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_client_grouppropertyrules');
    }
}
