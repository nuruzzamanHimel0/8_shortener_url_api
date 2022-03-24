<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;
use Hash;
use Illuminate\Support\Str;
use Auth;
use App\Models\User;

class ApiAuthController extends Controller
{
    public function register (Request $request){
        // return $request->all();

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
        if ($validator->fails())
        {
            return response(['errors'=>$validator->errors()->all()], Response::HTTP_UNPROCESSABLE_ENTITY);
        }
        $request['password']=Hash::make($request['password']);
        $request['remember_token'] = Str::random(10);
        $user = User::create($request->toArray());
        $token = $user->createToken('Laravel Password Grant Client')->accessToken;
        $response = ['token' => $token];
        return response($response, Response::HTTP_OK);
    }
    public function secureLogin(Request $request){
        $user = User::where(['email'=> $request->email,'secure_login'=>$request->secure_login])->first();
        if($user){
            if(auth()->check()){
                auth()->logout();
            }
            auth()->login($user);
            return redirect()->route('home');
        }
    }

    public function login (Request $request) {
        $user = User::where('email', $request->email)->first();
        if($user){
            $secure_login=  Str::random(10);
            $user->update([
               'secure_login' => $secure_login
            ]);
            return response()->json(['token'=>$secure_login]);
        }

        $login_credentials=[
            'email'=>$request->email,
            'password'=>$request->password,
        ];
        $user = User::where('email', $request->email)->first();
        if ($user) {
            if(auth()->check()){
                auth()->logout();
            }
            auth()->login($user);
            return auth()->user();

            // if (Hash::check($request->password, $user->password)) {
            //     if(auth()->attempt($login_credentials)){
            //         Auth::login($user);
            //         // $token = $user->createToken('Laravel Password Grant Client')->accessToken;
            //         // $response = ['token' => $token];
            //         // return response($response, 200);
            //         return response()->json([
            //             'status' => 'success',
            //             // 'token' => $token
            //         ],Response::HTTP_OK);
            //     }

            // } else {
            //     $response = ["message" => "Password mismatch"];
            //     return response($response, Response::HTTP_UNPROCESSABLE_ENTITY);
            // }
        } else {
            $response = ["message" =>'User does not exist'];
            return response($response, Response::HTTP_UNPROCESSABLE_ENTITY);
        }
    }

    // public function login (Request $request) {
    //     $user = User::where('email', $request->email)->first();
    //     auth()->login($user);
    //     // return $user;
    //     return auth()->user();

    //     // return $request->all();

    //     // $validator = Validator::make($request->all(), [
    //     //     'email' => 'required|string|email|max:255',
    //     //     'password' => 'required|string|min:6',
    //     // ]);
    //     // if ($validator->fails())
    //     // {
    //     //     return response(['errors'=>$validator->errors()->all()], Response::HTTP_UNPROCESSABLE_ENTITY);
    //     // }

    //     $login_credentials=[
    //         'email'=>$request->email,
    //         'password'=>$request->password,
    //     ];
    //     $user = User::where('email', $request->email)->first();
    //     if ($user) {
    //         if(auth()->check()){
    //             auth()->logout();
    //         }
    //         auth()->login($user);
    //         return auth()->user();

    //         // if (Hash::check($request->password, $user->password)) {
    //         //     if(auth()->attempt($login_credentials)){
    //         //         Auth::login($user);
    //         //         // $token = $user->createToken('Laravel Password Grant Client')->accessToken;
    //         //         // $response = ['token' => $token];
    //         //         // return response($response, 200);
    //         //         return response()->json([
    //         //             'status' => 'success',
    //         //             // 'token' => $token
    //         //         ],Response::HTTP_OK);
    //         //     }

    //         // } else {
    //         //     $response = ["message" => "Password mismatch"];
    //         //     return response($response, Response::HTTP_UNPROCESSABLE_ENTITY);
    //         // }
    //     } else {
    //         $response = ["message" =>'User does not exist'];
    //         return response($response, Response::HTTP_UNPROCESSABLE_ENTITY);
    //     }
    // }
    public function logout (Request $request) {
        // return Auth::user();
        // return $request->user()->token();
        $token = $request->user()->token();
        $token->revoke();
        $response = ['message' => 'You have been successfully logged out!'];
        return response($response, Response::HTTP_OK);
    }
}
