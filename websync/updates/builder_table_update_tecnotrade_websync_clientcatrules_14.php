<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatrules14 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->dropColumn('is_root_se_valore_null');
            $table->dropColumn('is_root_se_valore_uguale_a');
            $table->dropColumn('is_root_se_lunghezza_uguale_a');
            $table->dropColumn('is_child_se_lunghezza_multipla_di');
            $table->dropColumn('child_moltiplicatore_iniziale');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->boolean('is_root_se_valore_null')->nullable();
            $table->string('is_root_se_valore_uguale_a', 255)->nullable();
            $table->integer('is_root_se_lunghezza_uguale_a')->nullable();
            $table->integer('is_child_se_lunghezza_multipla_di')->nullable();
            $table->integer('child_moltiplicatore_iniziale')->nullable();
        });
    }
}
