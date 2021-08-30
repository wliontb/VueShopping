<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Facades\Image;

class SliderController extends Controller
{
    public function index(){
        return Slider::all();
    }

    public function store(Request $request){
        try {
            DB::beginTransaction();
            $dataInsert = [
                'name' => $request->name,
                'description' => $request->description,
            ];

            //upload image
            if(!empty($request->image_path)){
                if(strpos($request->image_path,'base64')!=false){
                    $image = $request->get('image_path');
                    $name = 'slide'.time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                    Image::make($image)->save(public_path('storage/sliders/').$name);
                    $name = '/storage/sliders/'.$name;
                    $dataInsert['image_path'] = $name;
                }
            }
            Slider::create($dataInsert);
            DB::commit();
            return response()->json(['message' => 'create slider success'], 200);
        }catch (\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'error create slider'],503);
        }

    }

    public function update(Request $request,$id){
        try {
            DB::beginTransaction();
            $dataUpdate = [
                'name' => $request->name,
                'description' => $request->description,
            ];

            //upload image
            if(!empty($request->image_path)){
                if(strpos($request->image_path,'base64')!=false){
                    $image = $request->get('image_path');
                    $name = 'slide'.time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                    Image::make($image)->save(public_path('storage/sliders/').$name);
                    $name = '/storage/sliders/'.$name;
                    $dataUpdate['image_path'] = $name;
                }
            }
            Slider::find($id)->update($dataUpdate);
            DB::commit();
            return response()->json(['message' => 'update slider success'], 200);
        }catch (\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'error update slider'],503);
        }
    }
}
