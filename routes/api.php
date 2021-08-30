<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ImageController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\BlogController;
use App\Http\Controllers\Api\SliderController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'], function ($router) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
});
Route::get('activeorder/{id}',[OrderController::class, 'activeorder']);
Route::get('product-order/{id}',[OrderController::class, 'productorder']);
Route::get('product-order/{id}',[OrderController::class, 'productorder']);
Route::get('user-order/{id}',[OrderController::class, 'userorder']);
Route::get('detail-order/{id}',[OrderController::class, 'detailorder']);
Route::get('search',[ProductController::class,'searchproduct']);
Route::get('productsbycategory/{id}',[ProductController::class,'productcategory']);
Route::resource('products', ProductController::class);
Route::resource('categories', CategoryController::class);
Route::get('image-product/{id}',[ImageController::class, 'imageproduct']);
Route::resource('images', ImageController::class);
Route::resource('orders', OrderController::class);
Route::resource('users', UserController::class);
Route::resource('blogs', BlogController::class);
Route::resource('sliders', SliderController::class);
