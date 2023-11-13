<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncProducts extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_products', function($table)
        {
            $table->string('slug', 191)->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_products', function($table)
        {
            $table->dropColumn('slug');
        });
    }
}
