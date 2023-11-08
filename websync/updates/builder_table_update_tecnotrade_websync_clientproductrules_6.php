<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductrules6 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->string('elimina_da_mall_se_uguale_a', 10)->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->integer('elimina_da_mall_se_uguale_a')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
}
