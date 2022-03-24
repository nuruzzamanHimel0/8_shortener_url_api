<?php

namespace App\Exceptions;

use Exception;

class InvalideUrlException extends Exception
{
    public function render()
    {
        return [
            'error' => 'This URL is Invalide. Please Enter valide URL'
        ];
    }
}
