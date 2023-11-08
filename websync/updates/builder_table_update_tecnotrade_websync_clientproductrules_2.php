<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductrules2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->boolean('primary_key')->nullable();
            $table->boolean('somma_campi_numerici')->nullable();
            $table->boolean('concatena_campi_come_stringa')->nullable();
            $table->string('elimina_da_mall_se_inizia_per')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->dropColumn('primary_key');
            $table->dropColumn('somma_campi_numerici');
            $table->dropColumn('concatena_campi_come_stringa');
            $table->dropColumn('elimina_da_mall_se_inizia_per');
        });
    }
}
