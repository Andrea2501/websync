<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncCategory extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_category', function($table)
        {
            $table->dropColumn('productfield_id');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_category', function($table)
        {
            $table->integer('productfield_id')->nullable();
        });
    }
}
