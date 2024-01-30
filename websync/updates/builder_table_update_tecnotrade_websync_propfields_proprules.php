<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncPropfieldsProprules extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_propfields_proprules', function($table)
        {
            $table->dropPrimary(['propfields_id','proprules_id']);
            $table->integer('client_prop_fields_id');
            $table->integer('client_prop_rules_id');
            $table->dropColumn('propfields_id');
            $table->dropColumn('proprules_id');
            $table->primary(['client_prop_fields_id','client_prop_rules_id']);
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_propfields_proprules', function($table)
        {
            $table->dropPrimary(['client_prop_fields_id','client_prop_rules_id']);
            $table->dropColumn('client_prop_fields_id');
            $table->dropColumn('client_prop_rules_id');
            $table->integer('propfields_id');
            $table->integer('proprules_id');
            $table->primary(['propfields_id','proprules_id']);
        });
    }
}
