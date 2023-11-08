<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatrules6 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->integer('chiled_moltiplicatore_iniziale')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->dropColumn('chiled_moltiplicatore_iniziale');
        });
    }
}
