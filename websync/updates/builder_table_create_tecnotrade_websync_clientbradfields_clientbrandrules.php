<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncClientbradfieldsClientbrandrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_clientbradfields_clientbrandrules', function($table)
        {
            $table->integer('clientbrandfields_id');
            $table->integer('clientbrandrules_id');
            $table->primary(['clientbrandfields_id','clientbrandrules_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_clientbradfields_clientbrandrules');
    }
}
