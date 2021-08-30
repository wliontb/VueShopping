<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\ProductOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class OrderController extends Controller
{
    public function index(){
        return Order::all();
    }

    public function store(Request $request){
        try{
            DB::beginTransaction();
            $dataInsert = [
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'address' => $request->address,
                'note' => $request->note,
                'total' => $request->total,
                'quantity' => $request->quantity,
                'payment' => $request->payment,
                'user_id' => $request->user_id,
            ];

            $order = Order::create($dataInsert);
            //add product_orders
            $carts = $request->cart;
            //$carts = json_decode(json_encode($request->cart), true);
            //var_dump($carts);
            foreach($carts as $key=>$value){
                $order->product_order()->create([
                    'product_id' => $value['id'],
                    'quantity' => $value['quantity'],
                ]);
            }
            DB::commit();
            return response()->json(['message' => 'add new order success'], 200);
        }catch (\Exception $exception){
            DB::rollBack();
            Log::error('Message : '.$exception->getMessage().'-- Line : '.$exception->getLine());
            return response()->json(['message'=>'add new order false'],503);
        }
    }

    public function show($id){
        return Order::find($id);
    }

    public function productorder($id){
        //find product order
        $product_orders = ProductOrder::where('order_id',$id)->get();
        //find product
        $products = array();
        foreach ($product_orders as $value){
            $product = $value->product()->first();
            $product->quantity = $value->quantity;
            $products[] = $product;
        }
        return $products;
    }

    public function userorder($userid){
        //find order
        $order = Order::where('user_id',$userid)->get();
        //product
//        $products = array();
//        foreach ($order->product_order()->product() as $value){
//            $product = $value->product()->first();
//            $product->quantity = $value->quantity;
//            $products[] = $product;
//        }
        return $order;
    }

    public function detailorder($id){
        //find order
        $order = ProductOrder::where('order_id',$id)->get();
        //product
        //return $order;
        $products = array();
        foreach ($order as $value){
            $product = $value->product()->first();
            $product->quantity = $value->quantity;
            $products[] = $product;
        }
        return $products;
    }

    public function activeorder($id){
        Order::find($id)->update(['status'=>1]);
        return response()->json(['message' => 'active order success'], 200);
    }
}
