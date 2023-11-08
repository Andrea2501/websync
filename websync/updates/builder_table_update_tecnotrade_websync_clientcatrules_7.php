<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateTecnotradeWebsyncClientcatrules7 extends Migration
{
    public function up()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->renameColumn('chiled_moltiplicatore_iniziale', 'child_moltiplicatore_iniziale');
        });
    }
    
    public function down()
    {
        Schema::table('tecnotrade_websync_clientcatrules', function($table)
        {
            $table->renameColumn('child_moltiplicatore_iniziale', 'chiled_moltiplicatore_iniziale');
        });
    }
}
