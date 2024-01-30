<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientGrouppropertiesfields extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_client_grouppropertiesfields', function($table)
        {
            $table->integer('order')->nullable()->change();
            $table->integer('fieldtype_id')->nullable()->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_client_grouppropertiesfields', function($table)
        {
            $table->integer('order')->nullable(false)->change();
            $table->integer('fieldtype_id')->nullable(false)->change();
        });
    }
}
