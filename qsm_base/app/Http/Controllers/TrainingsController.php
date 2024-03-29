<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Intervention\Image\ImageManagerStatic as Image;

use App\Models\TrainingModel;
use stdClass;

class TrainingsController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function index()
    {
        $today = Carbon::now()->toDateString();

        $active = TrainingModel::select('*')
            ->where('end_date', '>=', $today)
            ->orderBy('created_at', 'desc')
            ->get();

        $inActive = TrainingModel::select('*')
            ->where('end_date', '<', $today)
            ->orderBy('created_at', 'desc')
            ->get();

        $data = [
            'active' => $active,
            'inActive' => $inActive,
            'today_date' => $today,
        ];

        return response()->json($data, 200);
    }


    public function store(Request $req)
    {
        $title = $req->input('title');
        if (TrainingModel::where('title', $title)->exists()) {
            return response()->json('title already exists', 203);
        }

        $training = new TrainingModel();

        $start = Carbon::parse($req->start_date);
        $end = Carbon::parse($req->end_date);

        $training->title = $title;
        $training->info = $req->input('info');
        $training->venue = $req->input('venue');
        $training->price = $req->input('price');
        $training->start_date = $start->toDateString();
        $training->end_date = $end->toDateString();

        if ($req->file('image')) {
            $file = $req->file('image');
            $fileName = 'training-' . time() . '.' . $file->extension();

            $img = Image::make($file);
            $img->resize(800, 500, function ($constraint) {
                $constraint->aspectRatio();
            })->save('trainings_images/' . $fileName);

            $training->image = $fileName;
        }

        $training->save();

        // delete old trainings more than 7days
        return response()->json($this->deleteOldTrainings(), 200);
    }

    private function deleteOldTrainings()
    {
        $today = Carbon::today();
        try {
            $inActiveTrainings = TrainingModel::where('end_date', '<', $today)->get();

            if ($inActiveTrainings) {
                foreach ($inActiveTrainings as $record) {
                    $end_date = Carbon::parse($record->end_date);
                    if ($today->diffInDays($end_date) > 7) {
                        $this->destroy($record->id);
                    }
                }
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function show($id)
    {
        $training = TrainingModel::find($id);
        if (!$training) {
            return response()->json('not found', 203);
        }

        return response()->json($training, 200);
    }


    public function updateTraining(Request $req, string $id)
    {
        $training = TrainingModel::find($id);

        $start = Carbon::parse($req->start_date);
        $end = Carbon::parse($req->end_date);

        $training->title =  $req->input('title');
        $training->info = $req->input('info');
        $training->venue = $req->input('venue');
        $training->price = $req->input('price');
        $training->start_date = $start->toDateString();
        $training->end_date = $end->toDateString();

        if ($req->file('image')) {

            // delete old image
            if ($training->image) {
                $imgFile = 'trainings_images/' . $training->image;
                if (file_exists($imgFile)) {
                    unlink($imgFile);
                }
            }

            // replace with new one
            $file = $req->file('image');
            $fileName = 'training-' . time() . '.' . $file->extension();

            $img = Image::make($file);
            $img->resize(800, 500, function ($constraint) {
                $constraint->aspectRatio();
            })->save('trainings_images/' . $fileName);

            $training->image = $fileName;
        }

        $training->save();
        return response()->json('updated', 200);
    }


    public function destroy(string $id)
    {
        $training = TrainingModel::find($id);

        if (!$training) {
            return response()->json('not found', 203);
        }

        if ($training->image) {
            $imgFile = 'trainings_images/' . $training->image;
            if (file_exists($imgFile)) {
                unlink($imgFile);
            }
        }

        DB::table('tbl_registrations')->where('training', $id)->delete();

        $training->delete();

        return response()->json('deleted', 200);
    }

    public function registrationList($training_id)
    {

        $regs = DB::table('tbl_registrations')->where('training', $training_id)->get();
        $unique = collect($regs)->unique('email');
        return response()->json($unique->values()->all(), 200);


        // $today = Carbon::now();

        // $active =  DB::table('tbl_registrations')
        //     ->where('expiry', '>=', $today)->get();

        // $inActive =  DB::table('tbl_registrations')
        //     ->where('expiry', '<', $today)->get();

        // if (sizeof($active) > 0) {
        //     foreach ($active as $record) {
        //         $ids = explode(',', $record->trainings);
        //         $record->list = TrainingModel::find($ids);
        //     }
        // }

        // if (sizeof($inActive) > 0) {
        //     foreach ($inActive as $record) {
        //         $ids = explode(',', $record->trainings);
        //         $record->list = TrainingModel::find($ids);
        //     }
        // }

        // $data = [
        //     'active' => $active,
        //     'inActive' => $inActive
        // ];

        // return response()->json($data, 200);
    }

    public function deleteRegistration($id)
    {
        DB::table('tbl_registrations')->where('id', $id)->delete();
        return response()->json('deleted', 200);
    }

    // users
    public function activeTrainings()
    {
        $today = Carbon::now()->toDateString();
        $active = TrainingModel::select('*')->where('end_date', '>=', $today)->orderBy('start_date')->get();
        return response()->json($active, 200);
    }

    public function nextComingTraining()
    {
        $today = Carbon::now()->toDateString();
        $nextComing = TrainingModel::where('end_date', '>=', $today)->orderBy('start_date')->first();
        $nextComing->daysToGo = round(Carbon::now()->floatDiffInDays(Carbon::parse($nextComing->start_date)));
        return response()->json($nextComing, 200);
    }

    public function trainingRegistration(Request $req)
    {
        $ids = explode(',', $req->trainings);
        $trainingList = TrainingModel::find($ids);

        foreach ($trainingList as  $trn) {
            if ($trn) {
                DB::table('tbl_registrations')->insert([
                    'training' => $trn->id,
                    'name' => $req->input('name'),
                    'email' => $req->input('email'),
                    'phone' => $req->input('phone'),
                    'company' => $req->input('company'),
                    'expiry' => ' ',
                    'reg_date' => Carbon::now()
                ]);
                TrainingModel::where('id', $trn->id)->increment('reg_count');
            }
        }

        try {
            $mailObj = new stdClass();
            $mailObj->email = $req->input('email');
            $mailObj->trainingList = $trainingList;
            $mailObj->total = $req->input('total');
            $mailObj->name = $req->input('name');

            $mailer = new EmailController();
            $mailer->sendTrainingInvoice($mailObj);
            $mailer->newRegistrationAlert();
        } catch (\Throwable $th) {
            // throw $th;
        }


        // old code ########################################################
        // $trainings = TrainingModel::whereIn('id', $ids)->pluck('end_date')->toArray();
        // $lastDate = Carbon::parse($trainings[0]);
        // foreach ($trainings as $tr) {
        //     $row = Carbon::parse($tr);
        //     if ($row > $lastDate) {
        //         $lastDate = $row;
        //     }
        // }
        // old code ########################################################

        return response()->json('saved', 200);
    }
}
