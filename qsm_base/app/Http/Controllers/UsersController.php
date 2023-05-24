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
use App\Http\Controllers\NewsLetterController;
use stdClass;

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
            $mailObj = new stdClass();
            $mailObj->name = $req->input('name');
            $mailObj->email = $req->input('email');
            $mailObj->message = $req->input('message');
            $mailObj->phone = $req->input('phone');

            $mailer = new EmailController();
            $mailer->autoResponse($mailObj);
            $mailer->sendMessageAlert($mailObj);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return response()->json('saved', 200);
    }

    public function sendDownloadRequest(Request $req)
    {
        $mat = new MaterialsController();
        return $mat->sendDownloadRequest($req);
    }

    public function newsLetterSub($em)
    {
        $email = json_decode($em);
        if (DB::table('tbl_newsletter')->where('email', $email)->exists()) {
            return response()->json('exists', 203);
        }

        DB::table('tbl_newsletter')->insert(['email' => $email]);

        return response()->json('saved', 200);
    }

    public function newsLetterUnSub($em)
    {
        $email = json_decode($em);
        DB::table('tbl_newsletter')->where('email', $email)->delete();
    }


    public function activeTrainings()
    {
        $training = new TrainingsController();
        return $training->activeTrainings();
    }

    public function nextComingTraining()
    {
        $training = new TrainingsController();
        return $training->nextComingTraining();
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

    public function downloadNewsLetter($id)
    {
        $dn = new NewsLetterController();
        return $dn->downloadNewsLetter($id);
    }

    public function availableCategories()
    {
        $mat = new MaterialsController();
        return $mat->availableCategories();
    }
}
