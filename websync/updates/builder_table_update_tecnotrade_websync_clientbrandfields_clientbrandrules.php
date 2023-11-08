<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientbrandfieldsClientbrandrules extends Migration
{
    public function up()
    {
        Schema::rename('tecnotrade_websync_clientbradfields_clientbrandrules', 'tecnotrade_websync_clientbrandfields_clientbrandrules');
    }
    
    public function down()
    {
        Schema::rename('tecnotrade_websync_clientbrandfields_clientbrandrules', 'tecnotrade_websync_clientbradfields_clientbrandrules');
    }
}
