<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;



use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\MaterialModel;
use App\Models\TrainingModel;
use Carbon\Carbon;


class AdminController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function overview()
    {
        $today = Carbon::now()->toDateString();
        $overview = [
            'materials' => MaterialModel::all()->count(),
            'trainings' =>  [
                'inActive' => TrainingModel::where('end_date', '<', $today)->count(),
                'active' => TrainingModel::where('end_date', '>=', $today)->count(),
            ],
            'registrations' => DB::table('tbl_registrations')->get()->count(),
            'archives' => DB::table('tbl_archives')->get()->count(),
            'visitors' => DB::table('tbl_visitors')->get()->count(),
            // 'blog_posts' => DB::table('tbl_blog')->get()->count()
        ];

        return response()->json($overview, 200);
    }
}
