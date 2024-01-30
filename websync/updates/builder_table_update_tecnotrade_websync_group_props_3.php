<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncGroupProps3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_group_props', function($table)
        {
            $table->string('category_code')->nullable();
            $table->integer('category_october_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_group_props', function($table)
        {
            $table->dropColumn('category_code');
            $table->dropColumn('category_october_id');
        });
    }
}
