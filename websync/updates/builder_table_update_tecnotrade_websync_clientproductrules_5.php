<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductrules5 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->integer('elimina_da_mall_se_uguale_a')->nullable();
            $table->string('rule_name', 255)->nullable()->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductrules', function($table)
        {
            $table->dropColumn('elimina_da_mall_se_uguale_a');
            $table->string('rule_name', 255)->nullable(false)->change();
        });
    }
}
