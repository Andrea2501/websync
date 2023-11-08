<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductfields2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductfields', function($table)
        {
            $table->dropColumn('field_position');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductfields', function($table)
        {
            $table->integer('field_position')->nullable();
        });
    }
}
