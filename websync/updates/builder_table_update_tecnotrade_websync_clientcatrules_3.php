<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatrules3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->string('is_root_se_valore_uguale_a')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->boolean('is_root_se_valore_uguale_a')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
}
