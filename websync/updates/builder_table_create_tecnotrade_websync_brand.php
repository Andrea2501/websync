<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncBrand extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_brand', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('brand_name')->nullable();
            $table->string('brand_code')->nullable();
            $table->integer('october_id')->nullable();
            $table->integer('import_status')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_brand');
    }
}
