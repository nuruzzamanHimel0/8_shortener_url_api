<?php

namespace App\Providers;

use App\Library\UrlShortnerLibrary;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //bind or register service container
        app()->singleton('UrlShortner',function(){
            return new UrlShortnerLibrary;
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
        Schema::defaultStringLength(191);
    }
}
