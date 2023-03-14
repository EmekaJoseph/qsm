<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\UsersController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ArchiveController;
use App\Http\Controllers\MaterialsController;
use App\Http\Controllers\TrainingsController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\SettingsController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/



Route::controller(UsersController::class)->group(function () {
    Route::post('visitor',  'visitor');
    Route::get('activeTrainings',  'activeTrainings');
    Route::post('trainings/register',  'trainingRegistration');

    Route::get('latestMaterials',  'latestMaterials');
    Route::get('materialsByName/{name}',  'materialsByName');
    Route::get('materialsByCategory/{category_id}',  'materialsByCategory');
    Route::get('downloadMaterial/{code}',  'downloadMaterial');
});




//  ######################## PROTECT ########################## //

Route::controller(AdminController::class)->group(function () {
    Route::post('login',  'login');
    Route::post('logout/{id}',  'logout');
});

Route::controller(SettingsController::class)->group(function () {
    Route::post('addCategory',  'addCategory');
    Route::get('getCategories',  'getCategories');
    Route::post('renameCategory',  'renameCategory');
    Route::delete('deleteCategory/{category_id}',  'deleteCategory');
});

Route::get('/registrationList', [TrainingsController::class, 'registrationList']);
Route::delete('/deleteRegistration/{id}', [TrainingsController::class, 'deleteRegistration']);
Route::get('/generate_pin/{material_id}/{name}', [MaterialsController::class, 'generate_pin']);
Route::get('/view_pins', [MaterialsController::class, 'view_pins']);
Route::delete('/delete_pin/{id}', [MaterialsController::class, 'delete_pin']);

Route::apiResources([
    'archive' => ArchiveController::class,
    'materials' => MaterialsController::class,
    'trainings' => TrainingsController::class,
    'blog' => BlogController::class,
]);
