<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncGroupProps extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_group_props', function($table)
        {
            $table->string('category_code')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_group_props', function($table)
        {
            $table->dropColumn('category_code');
        });
    }
}
