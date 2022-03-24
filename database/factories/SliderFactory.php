<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Slider;
use Faker\Generator as Faker;

$factory->define(Slider::class, function (Faker $faker) {
    return [
        'title' => $faker->sentence ,
        'image' => $faker->imageUrl ,
        'prority' => rand(1,5) ,
        'status' => 1 ,
    ];
});
