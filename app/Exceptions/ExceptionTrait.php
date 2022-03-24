<?php
namespace App\Exceptions;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

trait ExceptionTrait{

    public function apiException($request,$exception){
        if($this->MethodNotAllowe($exception)){
            return $this->MethodNotAlloweResponse();
        }
        else if($this->NotFoundHttp($exception)){
            return $this->NotFoundHttpResponse();
        }
        return parent::render($request, $exception);
    }

    public function MethodNotAllowe($exception){
        return $exception instanceof MethodNotAllowedHttpException;
    }
    public function MethodNotAlloweResponse(){
        return response()->json([
            'message' => 'The GET method is not supported for this route. Supported methods: POST.'
        ],Response::HTTP_NOT_FOUND);
    }

    public function NotFoundHttp($exception){
        return $exception instanceof NotFoundHttpException;
    }
    public function NotFoundHttpResponse(){
        return response()->json([
            'message' => 'Not Found Http Exception.'
        ],Response::HTTP_NOT_FOUND);
    }
}
