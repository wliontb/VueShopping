<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\ProductImage;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Product::all();
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
                'category_id' => $request->category_id,
            ];

            //upload thumbnail
            if(!empty($request->thumbnail)){
                if(strpos($request->thumbnail,'base64')!=false){
                    $image = $request->get('thumbnail');
                    $name = 'thumb'.time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                    Image::make($image)->save(public_path('storage/products/').$name);
                    $name = '/storage/products/'.$name;
                    $dataInsert['thumbnail'] = $name;
                }
            }
            $product = Product::create($dataInsert);
            //upload detail image
            if(!empty($request->images)){
                $dataImages = array();
                foreach ($request->images as $key => $imagez){
                    $name = $key.time().'.' . explode('/', explode(':', substr($imagez, 0, strpos($imagez, ';')))[1])[1];
                    Image::make($imagez)->save(public_path('storage/products/').$name);
                    $imageInstance = new ProductImage([
                        'image_name' => $name,
                        'image_path' => $name = '/storage/products/'.$name,
                    ]);
                    $dataImages[] = $imageInstance;
                }
                $product->images()->saveMany($dataImages);
            }

            DB::commit();
            return response()->json(['message' => 'create product success'], 200);
        }catch(\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'error create product'],503);
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
        return Product::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            DB::beginTransaction();
            $dataUpdate = [
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
                'category_id' => $request->category_id,
            ];
            //upload thumbnail
            if(!empty($request->imagethumbnail)){
                if(strpos($request->imagethumbnail,'base64')!=false){
                    $image = $request->get('imagethumbnail');
                    $name = 'thumbnail'.time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
                    Image::make($image)->save(public_path('storage/products/').$name);
                    $name = '/storage/products/'.$name;
                    $dataUpdate['thumbnail'] = $name;
                }
            }
            //upload detail image
            if(!empty($request->images)){
                $dataImages = array();
                foreach ($request->images as $key => $imagez){
                    $name = $key.time().'.' . explode('/', explode(':', substr($imagez, 0, strpos($imagez, ';')))[1])[1];
                    Image::make($imagez)->save(public_path('storage/products/').$name);
                    $imageInstance = new ProductImage([
                        'image_name' => $name,
                        'image_path' => $name = '/storage/products/'.$name,
                    ]);
                    $dataImages[] = $imageInstance;
                }
                //var_dump($dataImages);
                Product::find($id)->images()->delete();
                Product::find($id)->images()->saveMany($dataImages);
            }

            Product::find($id)->update($dataUpdate);
            DB::commit();
            return response()->json(['message' => 'update product success'], 200);
        }catch(\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'error update product'],503);
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
        Product::find($id)->delete();
        return response()->json(['message'=>'delete success'],200);
    }

    public function productcategory($id){
        $category = Category::find($id);
        return $category->products;
    }

    public function searchProduct(Request $request){
        $keyword = $request->key;
        //find product
        $products = Product::where('name', 'like', '%'.$keyword.'%')->orWhere('product_desc', 'like', '%'.$keyword.'%')->get();
        return $products;
    }
}
