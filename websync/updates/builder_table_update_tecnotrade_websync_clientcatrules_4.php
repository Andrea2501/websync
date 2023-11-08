<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatrules4 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->renameColumn('elimina_da_mall_se_contiene', 'elimina_da_mall_se_inizia_per');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->renameColumn('elimina_da_mall_se_inizia_per', 'elimina_da_mall_se_contiene');
        });
    }
}
