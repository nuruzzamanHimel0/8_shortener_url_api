<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ShortnerUrlResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'userid' => $this->userid,
            'code' => $this->code,
            'shortlink' => $this->shortlink,
            'fulllink' => $this->fulllink,
            'visiteParMin' => $this->visiteParMin,
            'ipBlockTime' => $this->ipBlockTime,
        ];
    }
}
