<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncProducts3 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_products', function($table)
        {
            $table->string('codice_interno_padre')->nullable();
            $table->integer('october_prodotto_padre_id')->nullable();
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_products', function($table)
        {
            $table->dropColumn('codice_interno_padre');
            $table->dropColumn('october_prodotto_padre_id');
        });
    }
}
