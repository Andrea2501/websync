<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncGrouppropertiesfieldsGrouppropertyrules extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_grouppropertiesfields_grouppropertyrules', function($table)
        {
            $table->integer('id_group_properties_fields');
            $table->integer('id_group_property_rules');
            $table->primary(['id_group_properties_fields','id_group_property_rules']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_grouppropertiesfields_grouppropertyrules');
    }
}
