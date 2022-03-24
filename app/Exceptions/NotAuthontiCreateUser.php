<?php

namespace App\Exceptions;

use Exception;

class NotAuthontiCreateUser extends Exception
{
    public $message;
    public function __construct($message)
    {
        $this->message = $message;
    }

    public function render()
    {
        return [
            'error' => $this->message
        ];
    }
}
