<?php
namespace App\Library;

use App\Exceptions\InvalideUrlException;
use App\Exceptions\IpBlockExceptionWithTime;
use App\Models\ShortnerUrl;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Cache;


class UrlShortnerLibrary{

    public function shortenLink($code){
        $fetchUrl = ShortnerUrl::where('code',$code)->first();
        if(!is_null($fetchUrl)){
            $clientIp =  \Request::getClientIp(true);
            $visiteTime = $this->currentTime();
            $expireAt = $this->expireInMin(30);
             //already cache has
            if (Cache::has($code.$clientIp)) {
                $getCache = Cache::get($code.$clientIp);
                //check ip block or not
                if($getCache['status']){
                    //already blocked
                   return $this->alreadyBlockedCheck($visiteTime,$code,$clientIp,$fetchUrl,$expireAt);

                }
                 // ekhn o block hoy nai, check korbe hit ta ek i time y eseci kina
                 $recordTimeSTT = strtotime($getCache['recordTime']);
                 $visiteTimeSTT = strtotime($visiteTime);
                 if($recordTimeSTT == $visiteTimeSTT){
                    // cache ase and hit time same
                    if((int)$getCache['count'] === (int)$fetchUrl->visiteParMin ){
                        //r visite korte parbe na, block time set kora hbe
                        $this->isBlockedUrl($getCache,$code,$clientIp,$expireAt,$fetchUrl);
                    }
                    // ekhn o visite kore parbe
                    $getCache['count'] = $getCache['count'] + 1;
                    Cache::put($code.$clientIp,$getCache, $expireAt);
                    return redirect($fetchUrl->fulllink);
                 }
                 // url cache ase but hit time same na
                 Cache::forget($code.$clientIp);
                 $this->resetCache($code,$clientIp,$expireAt,$visiteTime);
                 return redirect($fetchUrl->fulllink);
            }
             // new cache create
             $this->resetCache($code,$clientIp,$expireAt,$visiteTime);
             return redirect($fetchUrl->fulllink);
        }
        //invalide url
        throw new InvalideUrlException();
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

        $durationInMin = $this->ipUnblockTImes($code,$clientIp);
        if($durationInMin >= 0){
            throw new IpBlockExceptionWithTime($durationInMin);
        }
    }

    public function alreadyBlockedCheck($visiteTime,$code,$clientIp,$fetchUrl,$expireAt){
        $getCache = Cache::get($code.$clientIp);
        $visiteTimeSTT = strtotime($visiteTime);
        $blockTimeSTT = strtotime($getCache['blockTime']);
        // dump($visiteTimeSTT < $blockTimeSTT);
        if($visiteTimeSTT < $blockTimeSTT){
            //already blocked with some times
            $durationInMin = $this->ipUnblockTImes($code,$clientIp);
            if($durationInMin >= 0){
                throw new IpBlockExceptionWithTime($durationInMin);
            }
        }else{
            // you can visite again . reset a cache
            $this->resetCache($code,$clientIp,$expireAt,$visiteTime);
            return redirect($fetchUrl->fulllink);
        }
    }

    public function currentTime(){
        return Carbon::now()->timezone('Asia/Dhaka')->format('Y/m/d H:i');
    }
    public function expireInMin($min){
        return Carbon::now()->timezone('Asia/Dhaka')->addMinute($min);
    }

    public function ipUnblockTImes($code,$clientIp){
        $getCache = Cache::get($code.$clientIp);
        $visiteTime = $this->currentTime();
        $blockTime = $getCache['blockTime'];
        $diff = strtotime($blockTime) - strtotime($visiteTime);
        $durationInMin = $diff / 60; // 60 min
        return $durationInMin;
    }
}
