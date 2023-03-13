<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

use App\Http\Controllers\TrainingsController;

class UsersController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function visitor(Request $req)
    {
        DB::table('tbl_visitors')
            ->updateOrInsert(
                ['ip_addr' => $req->ip()],
                ['ip_addr' => $req->ip(), 'visit_date' => Carbon::now()]
            );
    }


    public function activeTrainings(Request $req)
    {
        $training = new TrainingsController();

        return $training->activeTrainings($req);
    }


    public function trainingRegistration(Request $req)
    {
        $training = new TrainingsController();

        return $training->trainingRegistration($req);
    }
}
