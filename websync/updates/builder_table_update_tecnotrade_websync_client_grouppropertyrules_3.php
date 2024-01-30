<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientGrouppropertyrules3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_client_grouppropertyrules', function($table)
        {
            $table->boolean('is_category_code')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_client_grouppropertyrules', function($table)
        {
            $table->dropColumn('is_category_code');
        });
    }
}
