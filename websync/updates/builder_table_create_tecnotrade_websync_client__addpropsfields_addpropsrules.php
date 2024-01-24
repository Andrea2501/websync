<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientAddpropsfieldsAddpropsrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_client__addpropsfields_addpropsrules', function($table)
        {
            $table->integer('addpropsfields_id');
            $table->integer('addpropsrules_id');
            $table->primary(['addpropsfields_id','addpropsrules_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_client__addpropsfields_addpropsrules');
    }
}
