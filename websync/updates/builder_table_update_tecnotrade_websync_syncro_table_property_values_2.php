<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTablePropertyValues2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_property_values', function($table)
        {
            $table->boolean('is_product_code')->nullable()->unsigned(false)->default(null)->comment(null)->change();
            $table->boolean('is_parent_product_code')->nullable()->unsigned(false)->default(null)->comment(null)->change();
            $table->boolean('is_property_name')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_property_values', function($table)
        {
            $table->integer('is_product_code')->nullable()->unsigned(false)->default(null)->comment(null)->change();
            $table->integer('is_parent_product_code')->nullable()->unsigned(false)->default(null)->comment(null)->change();
            $table->integer('is_property_name')->nullable()->unsigned(false)->default(null)->comment(null)->change();
        });
    }
}
