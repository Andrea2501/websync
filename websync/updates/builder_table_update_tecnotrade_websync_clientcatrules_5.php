<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatrules5 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->integer('is_root_se_lunghezza_uguale_a')->nullable();
            $table->integer('is_child_se_lunghezza_multipla_di')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->dropColumn('is_root_se_lunghezza_uguale_a');
            $table->dropColumn('is_child_se_lunghezza_multipla_di');
        });
    }
}
