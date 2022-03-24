<?php
namespace App\Library;
use App\Models\ShortnerUrl;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Cache;


class UrlShortnerLibrary{
    public function shortenLink($code){
        $fetchUrl = ShortnerUrl::where('code',$code)->first();
        if(!is_null($fetchUrl)){
            $clientIp =  \Request::getClientIp(true);
            $visiteTime = Carbon::now()->timezone('Asia/Dhaka')->format('Y/m/d H:i');
            $expireAt = Carbon::now()->timezone('Asia/Dhaka')->addMinute(30);
             //already cache has
            if (Cache::has($code.$clientIp)) {
                $getCache = Cache::get($code.$clientIp);
                //check ip block or not
                if($getCache['status']){
                    //already blocked
                    $this->alreadyBlockedCheck($visiteTime,$code,$clientIp,$fetchUrl,$expireAt);

                }else{
                    // ekhn o block hoy nai, check korbe hit ta ek i time y eseci kina
                    $recordTimeSTT = strtotime($getCache['recordTime']);
                    $visiteTimeSTT = strtotime($visiteTime);
                    if($recordTimeSTT == $visiteTimeSTT){
                        // cache ase and hit time same
                        if((int)$getCache['count'] === (int)$fetchUrl->visiteParMin ){
                            dump('count equal');
                            //r visite korte parbe na, block time set kora hbe
                            $this->isBlockedUrl($getCache,$code,$clientIp,$expireAt,$fetchUrl);
                        }else{
                            dump('count increment');
                            // ekhn o visite kore parbe
                            $getCache['count'] = $getCache['count'] + 1;
                            Cache::put($code.$clientIp,$getCache, $expireAt);
                            dump(Cache::get($code.$clientIp));
                            return redirect($fetchUrl->fulllink);
                        }
                    }else{
                        // url cache ase but hit time same na
                        Cache::forget($code.$clientIp);
                        $this->resetCache($code,$clientIp,$expireAt,$visiteTime);
                        return redirect($fetchUrl->fulllink);
                    }
                }
            }else{
                // new cache create
                dump('new cache');
                $this->resetCache($code,$clientIp,$expireAt,$visiteTime);
                return redirect($fetchUrl->fulllink);
            }
        }else{
            dd('Invalide URL');
        }
    }

    public function resetCache($code,$clientIp,$expireAt,$visiteTime){
        $visiteUrlHistory = array(
            'recordTime' => $visiteTime,
            'count' => 1,
            'status' => false,
            'blockTime' => null
        );
        Cache::put($code.$clientIp,$visiteUrlHistory, $expireAt);
        // dump($visiteUrlHistory , Cache::get($code.$clientIp));
    }

    public function isBlockedUrl($getCache,$code,$clientIp,$expireAt,$fetchUrl){
        $blockTime = Carbon::now()->timezone('Asia/Dhaka')->addMinute($fetchUrl->ipBlockTime)->format('Y/m/d H:i');
        $getCache['status'] = true;
        $getCache['blockTime'] = $blockTime;
        Cache::put($code.$clientIp,$getCache, $expireAt);
         //exception throw
         dump('visite time is overe');
    }

    public function alreadyBlockedCheck($visiteTime,$code,$clientIp,$fetchUrl,$expireAt){
        $getCache = Cache::get($code.$clientIp);
        $visiteTimeSTT = strtotime($visiteTime);
        $blockTimeSTT = strtotime($getCache['blockTime']);
        if($visiteTimeSTT <= $blockTimeSTT){
            //already blocked with some times
            dump(Cache::get($code.$clientIp));
            dump("already blocked");
        }else{
            // you can visite again . reset a cache
            $this->resetCache($code,$clientIp,$expireAt,$visiteTime);
            return redirect($fetchUrl->fulllink);
        }
    }
}
