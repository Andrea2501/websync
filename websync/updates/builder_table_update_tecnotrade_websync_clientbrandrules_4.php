<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientbrandrules4 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientbrandrules', function($table)
        {
            $table->string('elimina_da_mall_se_uguale_a', 255)->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientbrandrules', function($table)
        {
            $table->text('elimina_da_mall_se_uguale_a')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
}
