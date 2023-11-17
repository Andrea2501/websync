<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatfields extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatfields', function($table)
        {
            $table->integer('fieldtype_id')->default(1)->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatfields', function($table)
        {
            $table->integer('fieldtype_id')->default(null)->change();
        });
    }
}
