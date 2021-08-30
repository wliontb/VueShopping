<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMoreColumnToTableProducts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->string('slug');
            $table->string('author');
            $table->string('publisher');
            $table->string('series')->nullable();
            $table->integer('chap')->default(1);
            $table->integer('page_number');
            $table->integer('cover_form')->default(1);
            $table->string('language')->default('Tiếng Việt');
            $table->integer('star')->default(5);
            $table->integer('recommend_display')->default(0);
            $table->integer('deal_display')->default(0);
            $table->integer('category_id');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('products', function (Blueprint $table) {
            //
        });
    }
}
