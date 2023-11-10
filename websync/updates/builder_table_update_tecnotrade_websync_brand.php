<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncBrand extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_brand', function($table)
        {
            $table->text('description')->nullable();
            $table->string('slug')->nullable();
            $table->string('website')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_brand', function($table)
        {
            $table->dropColumn('description');
            $table->dropColumn('slug');
            $table->dropColumn('website');
        });
    }
}
