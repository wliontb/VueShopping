<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Facades\Image;

class BlogController extends Controller
{
    public function index()
    {
        return Blog::all();
    }

    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $dataInsert = [
                'title' => $request->title,
                'blog_desc' => $request->blog_desc,
                'content' => $request->content,
                'user_id' => $request->user_id,
            ];

            //upload file
            if(!empty($request->thumbnail)){
                if(strpos($request->thumbnail,'base64')!=false){
                    $image = $request->get('thumbnail');
                    $name = 'thumb'.time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                    Image::make($image)->save(public_path('storage/blogs/').$name);
                    $name = '/storage/blogs/'.$name;
                    $dataInsert['thumbnail'] = $name;
                }
            }

            Blog::create($dataInsert);
            DB::commit();
            return response()->json(['message'=>'Create blog successfully'],200);
        }catch (\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'error create blog'],503);
        }


    }

    public function update(Request $request, $id){
        try {
            DB::beginTransaction();
            $dataUpdate = [
                'title' => $request->title,
                'blog_desc' => $request->blog_desc,
                'content' => $request->content,
                'user_id' => $request->user_id,
            ];

            //upload image
            if(!empty($request->thumbnail)){
                if(strpos($request->thumbnail,'base64')!=false){
                    $image = $request->get('thumbnail');
                    $name = 'thumb'.time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                    Image::make($image)->save(public_path('storage/blogs/').$name);
                    $name = '/storage/blogs/'.$name;
                    $dataUpdate['thumbnail'] = $name;
                }
            }

            Blog::find($id)->update($dataUpdate);
            DB::commit();
            return response()->json(['message'=>'Update blog successfully'],200);
        }catch (\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'error update blog'],503);
        }

    }
}
