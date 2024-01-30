<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncProprules extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_proprules', function($table)
        {
            $table->boolean('is_filter_type')->nullable();
            $table->boolean('is_measure_unit')->nullable()->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_proprules', function($table)
        {
            $table->dropColumn('is_filter_type');
            $table->boolean('is_measure_unit')->nullable(false)->change();
        });
    }
}
