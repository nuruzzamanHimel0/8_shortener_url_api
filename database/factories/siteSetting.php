<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\SiteSetting;
use Faker\Generator as Faker;

$factory->define(SiteSetting::class, function (Faker $faker) {
    return [
        'email' => $faker->freeEmail ,
        'phone' => $faker->phoneNumber ,
        'address' => $faker->text ,
        'shipping_cost' =>100 ,
    ];
});
