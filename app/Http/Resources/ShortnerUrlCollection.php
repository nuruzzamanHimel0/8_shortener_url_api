<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class ShortnerUrlCollection extends Resource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'code' => $this->code,
            'shortlink' => $this->shortlink,
            'fulllink' => $this->fulllink,
            'visiteParMin' => $this->visiteParMin,
            'ipBlockTime' => $this->ipBlockTime,
        ];
    }
}
