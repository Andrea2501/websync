<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientbrandfieldsClientbrandrules2 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientbrandfields_clientbrandrules', function($table)
        {
            $table->dropPrimary(['clientbrandfields_id','clientbrandrules_id']);
            $table->integer('client_brand_fields_id');
            $table->integer('client_brand_rules_id');
            $table->dropColumn('clientbrandfields_id');
            $table->dropColumn('clientbrandrules_id');
            $table->primary(['client_brand_fields_id','client_brand_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientbrandfields_clientbrandrules', function($table)
        {
            $table->dropPrimary(['client_brand_fields_id','client_brand_rules_id']);
            $table->dropColumn('client_brand_fields_id');
            $table->dropColumn('client_brand_rules_id');
            $table->integer('clientbrandfields_id');
            $table->integer('clientbrandrules_id');
            $table->primary(['clientbrandfields_id','clientbrandrules_id']);
        });
    }
}
