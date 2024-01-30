<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientpropvaluerules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientpropvaluerules', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('rule_name')->nullable();
            $table->string('label')->nullable();
            $table->boolean('is_data_update')->nullable();
            $table->boolean('is_primary_key')->nullable();
            $table->boolean('is_product_code')->nullable();
            $table->boolean('is_parent_product_code')->nullable();
            $table->boolean('is_property_code')->nullable();
            $table->boolean('is_property_value')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientpropvaluerules');
    }
}
