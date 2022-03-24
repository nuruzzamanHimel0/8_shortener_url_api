<?php

use Illuminate\Http\Request;


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();

});

Route::group(['prefix'=>'/','namespace'=>"Fontend\Api",'middleware'=>['auth:api','throttle:80,1']], function(){
    Route::post('access-token', 'Auth\AuthController@accessToken');
    Route::post('/get-link/{userid}', 'ShortnerUrlController@index');
    Route::post('/generate-shorten-link', 'ShortnerUrlController@store');
    Route::put('/update-link/{id}/user/{userid}', 'ShortnerUrlController@update');
    Route::post('/show-link/{id}/user/{userid}', 'ShortnerUrlController@show');
    Route::delete('/delete-link/{id}/user/{userid}', 'ShortnerUrlController@destroy');
});

Route::group(['prefix'=>'/','namespace'=>"Fontend\Api",'middleware'=>['throttle:80,1']], function(){

    //auth
    Route::post('registration', 'Auth\AuthController@registration');
    Route::post('login', 'Auth\AuthController@login');

});

