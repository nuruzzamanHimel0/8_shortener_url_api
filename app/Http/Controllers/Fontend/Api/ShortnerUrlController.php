<?php

namespace App\Http\Controllers\Fontend\Api;

use App\Exceptions\NotAuthontiCreateUser;
use App\Exceptions\OnlyAuthCreatorCanDelete;
use App\Exceptions\OnlyAuthCreatorCanUpdate;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\ShortnerUrlCollection;
use App\Http\Resources\ShortnerUrlResource;
use App\Models\ShortnerUrl;
use App\Models\User;
use Carbon\Carbon;
use Symfony\Component\HttpFoundation\Response;
use Auth;

class ShortnerUrlController extends Controller
{

    public function index($userid){

        $getUrl = ShortnerUrl::where('userid',$userid)
                ->latest()->get();
        if(count($getUrl) > 0){
            return response()->json([
                'status' => 'success',
                'getUrl' => ShortnerUrlCollection::collection( $getUrl )
            ],Response::HTTP_OK);
        }
        // return  ShortnerUrlCollection::collection( $getUrl );
    }

    public function store(Request $request){

        $request->validate([
            'fulllink' => 'required|url',
            'visiteParMin' => 'required',
            'ipBlockTime' => 'required',
         ]);
         $input = array();
         $loopTIme = 1;
         $currentSec= Carbon::now()->format('s');
         $domainName  = env('APP_URL');


         $input['userid'] = $request->userid;
         $input['fulllink'] = $request->fulllink;
         $input['visiteParMin'] = $request->visiteParMin;
         $input['ipBlockTime'] = $request->ipBlockTime;
         // unique 6 digites code genterate by checking DB
         $randomCode = $currentSec.str_random(4);
         $checkUniqueCode = ShortnerUrl::where('code',$randomCode)->first();

         while($loopTIme >= 0){
             $randomCode = $currentSec.str_random(4);
             $checkUniqueCode = ShortnerUrl::where('code',$randomCode)->first();
             if(empty($checkUniqueCode)){
                 break;
             }
         }
         $input['code'] = $randomCode;
         $input['shortlink'] = $domainName."/".$randomCode;

         $shortUrlCreate = ShortnerUrl::create($input);
         if(isset($shortUrlCreate)){
             return response()->json([
                 'status' => 'success',
             ],Response::HTTP_CREATED);
         }
    }


    public function show(Request $request){
        $this->onlyAuthCreatorShowCheck($request->userid);

        $singleUrl = ShortnerUrl::where('id', $request->id)
        ->where('userid', $request->userid)->first();
        // return $singleUrl;
        if(!is_null($singleUrl)){
            return response()->json([
                'status' => 'success',
                'singleUrl' => new ShortnerUrlResource($singleUrl)
            ],Response::HTTP_OK);
        }
    }



    public function update(Request $request, $id, $userid){

        $this->OnlyAuthCreatorCanUpdateCheck($userid);

        $request->validate([
            'fulllink' => 'required|url',
            'visiteParMin' => 'required',
            'ipBlockTime' => 'required',
         ]);

        $updateUrl = ShortnerUrl::where('id', $id)
        ->where('userid',$userid)->update([
            'fulllink' => $request->fulllink,
            'visiteParMin' => $request->visiteParMin,
            'ipBlockTime' => $request->ipBlockTime,
        ]);;
        if(isset($updateUrl)){
            return response()->json([
                'status' => 'success',
            ],Response::HTTP_CREATED);
        }
        // return $updateUrl;
    }

    public function destroy($id,$userid){

        $this->OnlyAuthCreatorCanDeleteCheck($userid);
        $deleteUrl = ShortnerUrl::where('id', $id)
        ->where('userid', $userid)->delete();
        if(isset($deleteUrl)){
            return response()->json([
                'status' => 'success',
            ],Response::HTTP_OK);
        }
    }

    public function onlyAuthCreatorShowCheck($userid){
        if (Auth::user()->id != $userid){
            throw new NotAuthontiCreateUser("Only authonticated creator can see the data");
        }
    }
    public function OnlyAuthCreatorCanUpdateCheck($userid){
        if (Auth::user()->id != $userid){
            throw new OnlyAuthCreatorCanUpdate('Only authonticated creator can update the data');
        }
    }
    public function OnlyAuthCreatorCanDeleteCheck($userid){
        if (Auth::user()->id != $userid){
            throw new OnlyAuthCreatorCanDelete("Only authonticated creator can Destroy the data");
        }
    }
}
