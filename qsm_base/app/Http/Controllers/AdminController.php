<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;

use App\Models\MaterialModel;
use App\Models\TrainingModel;
use App\Models\AccountModel;



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
            'messages' => DB::table('tbl_messages')->get()->count(),
            // 'blog_posts' => DB::table('tbl_blog')->get()->count()
        ];

        return response()->json($overview, 200);
    }


    public function newUser(Request $req)
    {
        $account = new AccountModel();
        if (AccountModel::where('username', $req->input('username'))->exists()) {
            return response()->json('exists', 203);
        }

        $account->username = $req->input('username');
        $account->role = $req->input('role');
        $account->password = Hash::make($req->input('password'));
        $account->save();
        return response()->json('created', 200);
    }


    public function login(Request $req)
    {
        $username = $req->input('username');
        $password = $req->input('password');

        $account = AccountModel::where('username', $username)->first();
        if (!$account || !Hash::check($password, $account->password)) {
            return response()->json('invalid', 203);
        }
        $account->last_login = Carbon::now();
        $account->save();

        $data = [
            'id' => $account->id,
            'role' => $account->role,
            'token' => $account->createToken('qsm_token')->plainTextToken,
        ];

        return response()->json($data, 200);
    }

    public function logout($id, Request $req)
    {
        try {
            $req->user()->currentAccessToken()->delete();
        } catch (\Throwable $th) {
        }
    }

    public function changePassword(Request $req)
    {
        $id = $req->input('id');
        $account = AccountModel::find($id);
        // return $account;

        $oldPass = $req->input('oldPass');

        if (!Hash::check($oldPass, $account->password)) {
            return response()->json('invalid details', 203);
        }

        $newHash = Hash::make($req->input('newPass'));

        $account->password = $newHash;
        $account->save();

        return response()->json('success', 200);
    }


    public function getMessages()
    {
        $messages = DB::table('tbl_messages')->orderByDesc('sent_date')->get();

        if (sizeof($messages) > 0) {
            foreach ($messages as $mes) {
                $mes->sent = (Carbon::parse($mes->sent_date))->diffForHumans();
            }
        }
        return response()->json($messages, 200);
    }

    public function deleteMessage($id)
    {
        DB::table('tbl_messages')->where('id', $id)->delete();
    }

    public function newslettersList()
    {
        // $emails =  DB::table('tbl_newsletter')->pluck('email')->toArray();
        $emails =  DB::table('tbl_newsletter')->get();
        return response()->json($emails, 200);
    }

    public function deleteNewslettersList($id)
    {
        DB::table('tbl_newsletter')->where('id', $id)->delete();
    }


    public function sendNewsletter(Request $req)
    {
        $emails =  DB::table('tbl_newsletter')->pluck('email')->toArray();
        $title = $req->input('title');
        $text = $req->input('text');
        if (sizeof($emails) > 0) {
            $mailer = new EmailController();
            try {
                foreach ($emails as $email) {
                    $mailer->sendNewsletter($title, $text, $email);
                }
            } catch (\Throwable $th) {
                //throw $th;
            }
        }
    }
}
