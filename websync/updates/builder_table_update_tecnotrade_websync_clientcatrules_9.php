<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatrules9 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->text('force_slug')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->boolean('force_slug')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
}
