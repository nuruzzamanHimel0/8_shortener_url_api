<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::apiResource('/userslider', 'Fontend\Api\SliderController');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();

});

Route::group(['prefix'=>'/','namespace'=>"Fontend\Api"], function(){

});

Route::resource('photos', 'TestCOntroller');

Route::group(['prefix'=>'/','namespace'=>"Fontend\Api"], function(){

    // ########### Shortner URL ##############

    //auth
    Route::post('registration', 'Auth\AuthController@registration');
    Route::post('login', 'Auth\AuthController@login');
    Route::post('access-token', 'Auth\AuthController@accessToken');

    //authonticate route must be seperated

    Route::post('/generate-shorten-link', 'ShortnerUrlController@store');
    Route::post('/get-link/{userid}', 'ShortnerUrlController@index');
    Route::post('/show-link/{id}/user/{userid}', 'ShortnerUrlController@show');
    Route::put('/update-link/{id}/user/{userid}', 'ShortnerUrlController@update');
    Route::delete('/delete-link/{id}/user/{userid}', 'ShortnerUrlController@destroy');



});



// Route::group(['namespace'=>'Fontend\Api'],function(){
//     Route::apiResource('slider', 'SliderController');
// });

// Route::get('admin/login', 'Admin\Api\Auth\LoginController@index')->name('admin.login');
