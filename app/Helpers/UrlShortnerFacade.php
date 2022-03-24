<?php
namespace App\Helpers;

class UrlShortnerFacade{
    public static function __callStatic($name, $arguments)
    {
        return app()->make(static::getFacadeAccessor())->$name(...$arguments);
    }
}
