<?php

namespace App\Helpers;

class UrlShortner extends UrlShortnerFacade{

    protected static function getFacadeAccessor()
    {
        return 'UrlShortner';
    }
}
