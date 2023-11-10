<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncCategory extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_category', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('name', 255);
            $table->string('slug')->nullable();
            $table->string('code');
            $table->string('meta_title', 255)->nullable();
            $table->text('meta_description')->nullable();
            $table->text('description')->nullable();
            $table->text('description_short')->nullable();
            $table->string('parent_code')->nullable();
            $table->integer('level')->nullable();
            $table->integer('parent_id')->nullable();
            $table->integer('october_id')->nullable();
            $table->integer('import_status')->nullable();
            $table->integer('productfield_id')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_category');
    }
}
