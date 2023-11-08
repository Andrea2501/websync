<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientproductfieldsClientproductrules extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientproductfields_clientproductrules', function($table)
        {
            $table->dropPrimary(['clientproductfields_id','clientproductrules_id']);
            $table->integer('client_product_fields_id');
            $table->integer('client_product_rules_id');
            $table->dropColumn('clientproductfields_id');
            $table->dropColumn('clientproductrules_id');
            $table->primary(['client_product_fields_id','client_product_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientproductfields_clientproductrules', function($table)
        {
            $table->dropPrimary(['client_product_fields_id','client_product_rules_id']);
            $table->dropColumn('client_product_fields_id');
            $table->dropColumn('client_product_rules_id');
            $table->integer('clientproductfields_id');
            $table->integer('clientproductrules_id');
            $table->primary(['clientproductfields_id','clientproductrules_id']);
        });
    }
}
