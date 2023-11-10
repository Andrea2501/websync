<?php namespace Tecnotrade\Websync\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateTecnotradeWebsyncProducts extends Migration
{
    public function up()
    {
        Schema::create('tecnotrade_websync_products', function($table)
        {
            $table->increments('id')->unsigned();
            $table->string('product_name')->nullable();
            $table->string('codice_interno_univoco')->nullable();
            $table->string('brand_code')->nullable();
            $table->string('category_code')->nullable();
            $table->text('excerpt')->nullable();
            $table->text('description')->nullable();
            $table->text('extended_description')->nullable();
            $table->string('meta_title')->nullable();
            $table->text('meta_description')->nullable();
            $table->integer('qty_in_stock_int')->nullable();
            $table->double('qty_in_stock_double', 10, 0)->nullable();
            $table->string('inventory_management_method')->nullable();
            $table->boolean('allow_out_of_stock_purchase')->nullable();
            $table->boolean('stackable')->nullable();
            $table->boolean('shippable')->nullable();
            $table->boolean('price_included_taxes')->nullable();
            $table->decimal('price', 10, 2)->nullable();
            $table->string('mpn')->nullable();
            $table->string('gtin')->nullable();
            $table->string('original_slug')->nullable();
            $table->integer('october_id')->nullable();
            $table->integer('category_october_id')->nullable();
            $table->integer('brand_october_id')->nullable();
            $table->integer('import_status')->nullable();
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('tecnotrade_websync_products');
    }
}
