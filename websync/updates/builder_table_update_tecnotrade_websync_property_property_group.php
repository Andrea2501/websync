<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncPropertyPropertyGroup extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_property_property_group', function($table)
        {
            $table->renameColumn('sorte_order', 'sort_order');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_property_property_group', function($table)
        {
            $table->renameColumn('sort_order', 'sorte_order');
        });
    }
}
