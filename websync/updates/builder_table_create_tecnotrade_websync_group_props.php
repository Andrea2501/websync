<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncGroupProps extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_group_props', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('name');
            $table->string('display_name');
            $table->string('unique_code')->nullable();
            $table->string('slug')->nullable();
            $table->text('description')->nullable();
            $table->integer('sort_order')->nullable();
            $table->integer('october_id')->nullable();
            $table->integer('import_status')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_group_props');
    }
}
