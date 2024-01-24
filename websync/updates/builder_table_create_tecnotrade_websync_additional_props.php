<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncAdditionalProps extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_additional_props', function($table)
        {
            $table->increments('id')->unsigned();
            $table->text('chiave')->nullable();
            $table->string('valore')->nullable();
            $table->string('product_code')->nullable();
            $table->integer('october_product_id')->nullable();
            $table->integer('import_status')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_additional_props');
    }
}
