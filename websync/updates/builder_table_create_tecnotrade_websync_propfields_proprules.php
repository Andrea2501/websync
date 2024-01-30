<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncPropfieldsProprules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_propfields_proprules', function($table)
        {
            $table->integer('propfields_id');
            $table->integer('proprules_id');
            $table->primary(['propfields_id','proprules_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_propfields_proprules');
    }
}
