<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientadditionalpropsrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientadditionalpropsrules', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('rule_name')->nullable();
            $table->string('label')->nullable();
            $table->text('description')->nullable();
            $table->boolean('is_prop_name')->nullable();
            $table->boolean('is_prop_value')->nullable();
            $table->boolean('is_product_code')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientadditionalpropsrules');
    }
}
