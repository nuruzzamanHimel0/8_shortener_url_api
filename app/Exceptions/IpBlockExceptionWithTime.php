<?php

namespace App\Exceptions;

use Exception;

class IpBlockExceptionWithTime extends Exception
{
    public $timeDuration;

    public function __construct($timeDuration)
    {
        $this->timeDuration = $timeDuration;
    }

    public function render()
    {
        return [
            'error' => 'Your IP is block for this URL for  '. $this->timeDuration.' Minutes'
        ];
    }
}
