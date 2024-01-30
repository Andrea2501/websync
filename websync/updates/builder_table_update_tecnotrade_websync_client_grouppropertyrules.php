<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientGrouppropertyrules extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_client_grouppropertyrules', function($table)
        {
            $table->boolean('is_data_update')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_client_grouppropertyrules', function($table)
        {
            $table->string('is_data_update', 255)->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
}
