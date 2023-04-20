<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

use App\Http\Controllers\TrainingsController;
use App\Http\Controllers\MaterialsController;
use App\Http\Controllers\EmailController;

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

    public function sendMessage(Request $req)
    {

        DB::table('tbl_messages')
            ->updateOrInsert(
                [
                    'email' => $req->input('email'),
                    'name' => $req->input('name'),
                    'message' => $req->input('message'),
                    'phone' => $req->input('phone')
                ],
                [
                    'email' => $req->input('email'),
                    'name' => $req->input('name'),
                    'message' => $req->input('message'),
                    'phone' => $req->input('phone'),
                    'sent_date' => Carbon::now()
                ]
            );
        try {
            $mailer = new EmailController();
            $mailer->sendMessageAlert(
                $req->input('name'),
                $req->input('email'),
                $req->input('message'),
            );
        } catch (\Throwable $th) {
            //throw $th;
        }

        return response()->json('saved', 200);
    }

    public function newsLetterSub($email)
    {
        if (DB::table('tbl_newsletter')->where('email', $email)->exists()) {
            return response()->json('exists', 203);
        }

        DB::table('tbl_newsletter')->insert(['email' => $email]);

        return response()->json('saved', 200);
    }

    public function newsLetterUnSub($email)
    {
        DB::table('tbl_newsletter')->where('email', $email)->delete();
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

    public function latestMaterials()
    {
        $mat = new MaterialsController();

        return $mat->latestMaterials();
    }

    public function materialsByName($name)
    {
        $mat = new MaterialsController();

        return $mat->materialsByName($name);
    }

    public function materialsByCategory($category_id)
    {
        $mat = new MaterialsController();

        return $mat->materialsByCategory($category_id);
    }

    public function downloadMaterial($code)
    {
        $mat = new MaterialsController();

        return $mat->downloadMaterial($code);
    }

    public function availableCategories()
    {
        $mat = new MaterialsController();

        return $mat->availableCategories();
    }
}
