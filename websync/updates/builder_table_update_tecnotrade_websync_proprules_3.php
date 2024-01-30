<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncProprules3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_proprules', function($table)
        {
            $table->boolean('is_type_of_property')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_proprules', function($table)
        {
            $table->dropColumn('is_type_of_property');
        });
    }
}
