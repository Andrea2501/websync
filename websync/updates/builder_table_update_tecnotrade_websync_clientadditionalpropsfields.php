<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientadditionalpropsfields extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientadditionalpropsfields', function($table)
        {
            $table->renameColumn('filedtype_id', 'fieldtype_id');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientadditionalpropsfields', function($table)
        {
            $table->renameColumn('fieldtype_id', 'filedtype_id');
        });
    }
}
