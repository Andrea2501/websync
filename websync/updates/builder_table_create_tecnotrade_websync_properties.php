<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncProperties extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_properties', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('name');
            $table->string('slug');
            $table->string('internal_code')->nullable();
            $table->string('type')->nullable();
            $table->string('unit')->nullable();
            $table->string('filter_type')->nullable();
            $table->boolean('use_for_variant')->nullable();
            $table->integer('import_status')->nullable();
            $table->integer('october_id')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_properties');
    }
}
