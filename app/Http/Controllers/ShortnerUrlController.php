<?php

namespace App\Http\Controllers;

use App\Helpers\UrlShortner;
use App\Models\ShortnerUrl;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Cache;

class ShortnerUrlController extends Controller
{
    public function shortenLink($code){
        return UrlShortner::shortenLink($code);
    }
}
