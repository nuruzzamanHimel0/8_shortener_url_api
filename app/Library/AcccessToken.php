<?php

namespace App\Library;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\SiteSetting;
use Illuminate\Support\Facades\Hash;
use GuzzleHttp\Client;

class AcccessToken extends Controller
{


    public function accessToken($accesToken){
        $http = new Client();
        $accessToken = $accesToken;
        $response = $http->request('GET', url("/api/user"), [
            'headers' => [
                'Accept' => 'application/json',
                'Authorization' => 'Bearer '.$accessToken,
            ],
        ]);

        return response()->json([

            'status' => "success",
            'data' => json_decode((string) $response->getBody(), true)
        ]);
    }






}
