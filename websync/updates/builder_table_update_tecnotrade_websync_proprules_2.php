<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncProprules2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_proprules', function($table)
        {
            $table->boolean('is_use_for_variation')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_proprules', function($table)
        {
            $table->dropColumn('is_use_for_variation');
        });
    }
}
