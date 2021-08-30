<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class ImageController extends Controller
{
    public function index(){

    }

    public function imageproduct($id){
        $arr = array();
        $images = Product::find($id)->images()->select('image_path')->get();
        //dd($images);
        foreach ($images as $key => $value){
            $arr[] = $value->image_path;
        }
        return $arr;
    }

    public function show($id){
        return Product::find($id)->images()->get();
    }

    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $dataInsert = [
                'name' => $request->name,
                'slug' => str_slug($request->name),
                'product_desc' => $request->product_desc,
                'detail_desc' => $request->detail_desc,
                'old_price' => $request->old_price,
                'current_price' => $request->current_price,
                'inventory' => $request->inventory,
                'author' => $request->author,
                'publisher' => $request->publisher,
                'series' => $request->series,
                'chap' => $request->chap,
                'page_number' => $request->page_number,
                'cover_form' => $request->cover_form,
                'language' => $request->language,
                'recommend_display' => $request->recommend_display,
                'deal_display' => $request->deal_display,
                'category_id' => 1,
            ];

            $product = Product::create($dataInsert);

            //upload file
            if ($request->file('file')) {
//            $file = $request->file('file');
//            $filename = $file->getClientOriginalName();
//            $filename = str_replace(' ','',$filename);
//            $path = $file->storeAs('uploads',$filename);
//            if($path){
//                $file_path = Storage::url($path);
//                return response()->json(['message'=>'file uploaded','file_path'=>$file_path],200);
//            } else {
//                return response()->json(['message'=>'error uploading file'],503);
//            }
                //multiple file upload
                $files = $request->file('file');
                if (!is_array($files)) {
                    $files = [$files];
                }
                for ($i = 0; $i < count($files); $i++) {
                    $file = $files[$i];
                    $filename = $file->getClientOriginalName();
                    $filename = str_replace(' ', '', $filename);
                    $path = $file->storeAs('public/products', $filename);
                    $filepath = Storage::url($path);

                    $product->images()->create([
                        'image_name'=>$filename,
                        'image_path'=>$filepath,
                    ]);
                }
                $product->update([
                    'thumbnail' => $product->images()->first()->image_path,
                ]);
            }
            DB::commit();
            return response()->json(['message' => 'create product success'], 200);
        }catch(\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'error create product'],503);
        }

    }
}
