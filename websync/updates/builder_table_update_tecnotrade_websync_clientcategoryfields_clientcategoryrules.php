<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcategoryfieldsClientcategoryrules extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcategoryfields_clientcategoryrules', function($table)
        {
            $table->dropPrimary(['clientcategoryfields_id','clientcategoryrules_id']);
            $table->integer('client_category_fields_id');
            $table->integer('client_category_rules_id');
            $table->dropColumn('clientcategoryfields_id');
            $table->dropColumn('clientcategoryrules_id');
            $table->primary(['client_category_fields_id','client_category_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcategoryfields_clientcategoryrules', function($table)
        {
            $table->dropPrimary(['client_category_fields_id','client_category_rules_id']);
            $table->dropColumn('client_category_fields_id');
            $table->dropColumn('client_category_rules_id');
            $table->integer('clientcategoryfields_id');
            $table->integer('clientcategoryrules_id');
            $table->primary(['clientcategoryfields_id','clientcategoryrules_id']);
        });
    }
}
