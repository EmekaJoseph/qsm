<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\UsersController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ArchiveController;
use App\Http\Controllers\MaterialsController;
use App\Http\Controllers\TrainingsController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\NewsLetterController;
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
    Route::get('nextComingTraining',  'nextComingTraining');
    Route::post('trainings/register',  'trainingRegistration');

    Route::get('latestMaterials',  'latestMaterials');
    Route::get('materialsByName/{name}',  'materialsByName');
    Route::get('materialsByCategory/{category_id}',  'materialsByCategory');
    Route::get('downloadMaterial/{code}',  'downloadMaterial');
    Route::get('availableCategories',  'availableCategories');
    Route::post('sendMessage',  'sendMessage');
    Route::post('sendDownloadRequest',  'sendDownloadRequest');
    Route::get('newsLetterSub/{email}',  'newsLetterSub');
    Route::get('newsLetterUnsub/{email}',  'newsLetterUnSub');
});

Route::post('login', [AdminController::class, 'login']);
Route::resource('blog', BlogController::class)->only(['index', 'show']);
Route::resource('newsletter', NewsLetterController::class)->only(['index']);
Route::resource('trainings', TrainingsController::class)->only(['show']);



//  ######################## PROTECT ########################## //
Route::group(['middleware' => ['auth:sanctum']], function () {

    Route::controller(AdminController::class)->group(function () {
        Route::post('logout/{id}',  'logout');
        Route::get('overview',  'overview');
        Route::post('newUser',  'newUser');
        Route::post('changePassword',  'changePassword');
        Route::get('getMessages',  'getMessages');
        Route::delete('deleteMessage/{id}',  'deleteMessage');
        Route::post('sendNewsletter',  'sendNewsletter');
        Route::get('newslettersList',  'newslettersList');
    });

    Route::controller(SettingsController::class)->group(function () {
        Route::post('addCategory',  'addCategory');
        Route::get('getCategories',  'getCategories');
        Route::post('renameCategory',  'renameCategory');
        Route::delete('deleteCategory/{category_id}',  'deleteCategory');
    });

    Route::controller(TrainingsController::class)->group(function () {
        Route::get('registrationList/{training_id}',  'registrationList');
        Route::delete('deleteRegistration/{id}',  'deleteRegistration');
        Route::post('updateTraining/{id}',  'updateTraining');
    });

    Route::controller(MaterialsController::class)->group(function () {
        Route::get('generate_pin/{material_id}/{ref}',  'generate_pin');
        Route::get('view_pins',  'view_pins');
        Route::delete('delete_pin/{id}',  'delete_pin');
    });

    Route::post('materialToArchive', [ArchiveController::class, 'materialToArchive']);

    Route::post('updateBlog/{blog_id}', [BlogController::class, 'updateBlog']);

    Route::apiResources([
        'archive' => ArchiveController::class,
        'materials' => MaterialsController::class,
    ]);

    Route::resource('blog', BlogController::class)->except(['index', 'show']);
    Route::resource('trainings', TrainingsController::class)->except(['show']);
    Route::resource('newsletter', NewsLetterController::class)->except(['index']);
});
