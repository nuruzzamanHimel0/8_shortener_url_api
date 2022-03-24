<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Paymentmethod;
use Faker\Generator as Faker;

$factory->define(Paymentmethod::class, function (Faker $faker) {
    return [
        'name' => $faker->name  ,
        'image' => $faker->imageUrl  ,
        'prority' =>rand(1,5),
        'short_name' => $faker->text(10)  ,
    ];
});
