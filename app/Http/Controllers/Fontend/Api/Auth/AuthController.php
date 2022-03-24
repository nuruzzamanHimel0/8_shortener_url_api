<?php

namespace App\Http\Controllers\Fontend\Api\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Image;
use GuzzleHttp\Client;

class AuthController extends Controller
{
    public function registration(Request $request){
        $this->validate($request, [
            'firstname' => 'required',
            'lastname' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required',
            'image' => 'required',
            'phone_no' => 'required',
            'present_address' => 'required',
        ]);

        $image = $request->input('image');
        // data:image/png;
        $strpos = strpos($image,';');
        $substr = substr($image,0,$strpos);
        $image_ext = substr(strrchr($substr,'/'),1);

        $imagename = $request->firstname."_".rand().".".$image_ext;
        $image_save = public_path('image/fontend/user/'.$imagename);

        // open an image file
        $img = Image::make($request->image);

        // save image in desired format
        if($img->save($image_save)){

            $createuser = User::create([
                'firstname' => $request->firstname,
                'lastname' => $request->lastname,
                'username' => $request->firstname.rand(1,1000),
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'image' => $imagename,
                'phone_no' => $request->phone_no,
                'userStatusId' => 1, // active
                'ip_address'=>$request->ip(),
                'present_address' => $request->present_address,

            ]);
            if(isset($createuser)){
                return response()->json([
                    'status' => 'success'
                ]);
            }
        }

        return response()->json([
            $request->all()
        ]);

    }

    public function login(Request $request){
        $validatedData = $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        $user = User::where('email',$request->email)
        ->where('userStatusId',User::USER_ACTIVE)->first();

        if(isset($user)){
            if(Hash::check($request->password,$user->password)){

                $token = $user->createToken('Laravel Password Grant Client')->accessToken;
                // return ($token);
                return response()->json([
                        'status' => "success",
                        'token' => $token,
                        'userid' => $user->id
                    ],200);

            }
            else {
                $response = ["message" => "Password mismatch"];
                return response($response, 422);
            }
        }else{
            return response()->json([
                'status' => "error",
                'msg' => "Data not found"
            ]);
        }

        // return response()->json([
        //     $siteSetting, $user
        // ]);

    }

    public function accessToken(Request $request){
        $http = new Client();
        $accessToken = $request->accessToken;
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

    public function logout(Request $request){
        $token = $request->user()->token();
        if($token->revoke()){
            $response = [
                'status' => 'success',
                'message' => 'You have been successfully logged out!'
            ];
            return response()->json($response,200);
        }
    }

}
