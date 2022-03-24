<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('firstname');
            $table->string('lastname');
            $table->string('username');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('image');
            $table->string('phone_no');
            $table->integer('userStatusId')->default(1)->comment('1=active,2=pending,3=successpend');
            $table->string('ip_address')->nullable();
            $table->text('present_address')->nullable();
            $table->text('shipping_address')->nullable();
            $table->integer('user_role')->default(1)->comment('1=user,2=admin');;
            $table->timestamp('email_verified_at')->nullable();

            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
