<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatrules2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->boolean('is_root_se_valore_null')->nullable();
            $table->boolean('is_root_se_valore_uguale_a')->nullable();
            $table->dropColumn('is_root');
            $table->dropColumn('is_child');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->dropColumn('is_root_se_valore_null');
            $table->dropColumn('is_root_se_valore_uguale_a');
            $table->boolean('is_root')->nullable();
            $table->boolean('is_child')->nullable();
        });
    }
}
