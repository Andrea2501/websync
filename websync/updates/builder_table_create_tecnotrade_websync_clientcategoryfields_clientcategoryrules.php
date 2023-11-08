<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientcategoryfieldsClientcategoryrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientcategoryfields_clientcategoryrules', function($table)
        {
            $table->integer('clientcategoryfields_id');
            $table->integer('clientcategoryrules_id');
            $table->primary(['clientcategoryfields_id','clientcategoryrules_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientcategoryfields_clientcategoryrules');
    }
}
