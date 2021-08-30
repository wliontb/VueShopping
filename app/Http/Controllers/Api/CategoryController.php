<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\CategoryUpdate;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Category::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $dataInsert = [
                'name' => $request->name,
                'slug' => str_slug($request->name),
                'cate_desc' => $request->cate_desc,
                'home_display' => $request->home_display,
                'hot_display' => $request->hot_display,
                'parent_id' => $request->parent_id,
            ];
            if($request->get('image')){
                $image = $request->get('image');
                $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                Image::make($image)->save(public_path('storage/categories/').$name);
                $name = '/storage/categories/'.$name;
                $dataInsert['thumbnail'] = $name;

            }
            Category::create($dataInsert);
            DB::commit();
            return response()->json(['message' => 'create category successfully'], 200);
        }catch (\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'created error'],503);
        }


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Category::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return ;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CategoryUpdate $request, Category $category)
    {
        try {
            DB::beginTransaction();
            $dataUpdate = $request->validated();
            $category->update($dataUpdate);
            //upload file
            if($request->get('image')){
                if(strpos($request->image,'base64')!=false){
                    $image = $request->get('image');
                    $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                    Image::make($image)->save(public_path('storage/categories/').$name);
                    $name = '/storage/categories/'.$name;
                    Category::find($category->id)->update(['thumbnail'=>$name]);
                }

            }
            DB::commit();
            return response()->json(['message' => 'updated successfully'], 200);
        } catch(\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'updated error'],503);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Category::find($id)->delete();
        return response()->json(['message'=>'delete success'],200);
    }
}
