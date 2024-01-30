<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncCategoryPropertyGroup extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_category_property_group', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('category_code');
            $table->string('property_group_code');
            $table->integer('october_category_id')->nullable();
            $table->integer('october_property_group_id')->nullable();
            $table->integer('import_status')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_category_property_group');
    }
}
