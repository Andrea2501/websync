<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class AddSlugAndCodeToMallBrand extends Migration
{
    public function up()
    {
        Schema::table('offline_mall_brands', function($table)
        {
            $table->text('code')->unique()->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('offline_mall_brands', function($table)
        {
            $table->dropColumn('code');
            
            
        });
    }
}
