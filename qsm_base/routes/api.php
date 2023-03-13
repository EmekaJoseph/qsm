<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\UsersController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ArchiveController;
use App\Http\Controllers\MaterialsController;
use App\Http\Controllers\TrainingsController;
use App\Http\Controllers\BlogController;
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
});




//  ######################## PROTECT ########################## //

Route::controller(AdminController::class)->group(function () {
    Route::post('login',  'login');
    Route::post('/logout/{id}',  'logout');
});

Route::get('/registrationList', [TrainingsController::class, 'registrationList']);
Route::delete('/deleteRegistration/{id}', [TrainingsController::class, 'deleteRegistration']);

Route::apiResources([
    'archive' => ArchiveController::class,
    'materials' => MaterialsController::class,
    'trainings' => TrainingsController::class,
    'blog' => BlogController::class,
]);
