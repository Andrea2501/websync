<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncProducts2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_products', function($table)
        {
            $table->boolean('visibility')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_products', function($table)
        {
            $table->dropColumn('visibility');
        });
    }
}
