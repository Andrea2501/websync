<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncSyncroTableProductFields extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_syncro_table_product_fields', function($table)
        {
            $table->integer('clientbrandrules_id')->nullable();
            $table->integer('clientcategoryrules_id')->nullable();
            $table->dropColumn('brand_field_relation_rule_name');
            $table->dropColumn('category_field_relation_rule_name');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_syncro_table_product_fields', function($table)
        {
            $table->dropColumn('clientbrandrules_id');
            $table->dropColumn('clientcategoryrules_id');
            $table->integer('brand_field_relation_rule_name')->nullable();
            $table->integer('category_field_relation_rule_name')->nullable();
        });
    }
}
