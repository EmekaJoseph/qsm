<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

use App\Models\NewsLetterModel;
use Carbon\Carbon;
use Illuminate\Support\Str;

class NewsLetterController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;


    public function index()
    {
        $list =  NewsLetterModel::select('id', 'title', 'created_at', 'category', 'doc')->orderByDesc('created_at')->limit(20)->get();
        if (sizeof($list) > 0) {
            foreach ($list as $li) {
                $li->created = (Carbon::parse($li->created_at))->diffForHumans();
            }
        }
        return response()->json($list, 200);
    }

    public function store(Request $req)
    {
        $title = $req->input('title');
        if (NewsLetterModel::where('title', $title)->exists()) {
            return response()->json('title already exists', 203);
        }

        $newsletter = NewsLetterModel::create([
            'title' => $req->input('title'),
            'category' => $req->input('category', null),
            'doc' => '',
        ]);

        if ($req->file('doc')) {
            $file = $req->file('doc');
            $fileName =  'newsletter_' . time() . '.' . $file->extension();
            $file->move('course_materials/', $fileName);

            $newsletter->doc = $fileName;
        }

        $newsletter->save();

        return response()->json('saved', 200);
    }


    public function show(string $id)
    {

        $NewsLetter = NewsLetterModel::find($id);

        if (!$NewsLetter) {
            return response()->json('not found', 203);
        }

        return response()->json($NewsLetter, 200);
    }


    public function update($id, Request $req)
    {

        if (NewsLetterModel::whereNot('id', $id)->where('title', $req->input('title'))->exists()) {
            return response()->json('title already exists', 203);
        }


        $NewsLetter = NewsLetterModel::find($id);
        $NewsLetter->title = $req->input('title');
        $NewsLetter->save();

        return response()->json('updated', 200);
    }


    public function destroy(string $id)
    {
        $NewsLetter = NewsLetterModel::find($id);

        if (!$NewsLetter) {
            return response()->json('not found', 203);
        }

        if ($NewsLetter->doc) {
            $doc = 'course_materials/' . $NewsLetter->doc;
            if (file_exists($doc)) {
                unlink($doc);
            }
        }

        $NewsLetter->delete();

        return response()->json('deleted', 200);
    }
}
