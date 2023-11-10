<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncCategory2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_category', function($table)
        {
            $table->integer('october_parent_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_category', function($table)
        {
            $table->dropColumn('october_parent_id');
        });
    }
}
