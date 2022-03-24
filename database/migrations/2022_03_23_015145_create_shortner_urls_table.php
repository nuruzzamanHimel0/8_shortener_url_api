<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShortnerUrlsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shortner_urls', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('userid');
            $table->string('code');
            $table->string('shortlink');
            $table->string('fulllink');
            $table->integer('visiteParMin');
            $table->integer('ipBlockTime');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shortner_urls');
    }
}
