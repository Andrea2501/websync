<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductfields extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductfields', function($table)
        {
            $table->integer('order')->nullable()->default(0);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductfields', function($table)
        {
            $table->dropColumn('order');
        });
    }
}
