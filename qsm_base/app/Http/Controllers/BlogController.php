<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

use App\Models\BlogModel;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Intervention\Image\ImageManagerStatic as Image;

class BlogController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;


    public function index()
    {
        $list =  BlogModel::select('blog_id', 'title', 'text', 'created_at', 'images')
            ->orderByDesc('created_at')->limit(20)->get();


        if (sizeof($list) > 0) {
            foreach ($list as $line) {
                $line->images = explode(',', $line->images);
            }
        }
        return response()->json($list, 200);
    }



    public function store(Request $request)
    {
        $title = $request->input('title');

        if (BlogModel::where('title', $title)->exists()) {
            return response()->json(['error' => 'title already exists'], 203);
        }

        $newBlog = new BlogModel();

        $newBlog->title = $title;
        $newBlog->text = $request->input('text');

        if ($request->images) {
            try {
                $imagesArray = json_decode($request->images);
                $nameArr = array();

                foreach ($imagesArray as $image) {
                    $parts = explode(';base64,', $image);
                    $base64 = base64_decode($parts[1]);
                    $fileName = 'blog-images/' . uniqid() . '.png';
                    file_put_contents($fileName, $base64);

                    $img = Image::make($fileName);
                    $newName = 'blog-' . uniqid() . '.png';
                    $img->resize(400, 400, function ($constraint) {
                        $constraint->aspectRatio();
                    })->save('blog-images/' . $newName);

                    array_push($nameArr, $newName);
                    unlink($fileName);
                }

                $newBlog->images = implode(',', $nameArr);
            } catch (\Throwable $th) {
                //throw $th;
            }
        }

        $newBlog->save();

        return response()->json($newBlog, 200);
    }


    public function show(string $id)
    {
        $blogPost = BlogModel::find($id);
        if (!$blogPost) {
            return response()->json('post not found', 203);
        }

        $blogPost->images = explode(',', $blogPost->images);
        return response()->json($blogPost, 200);
    }

    public function update(Request $request, string $id)
    {
        //
    }


    public function destroy(string $id)
    {
        $blogPost = BlogModel::find($id);

        if (!$blogPost) {
            return response()->json('post not found', 203);
        }

        if ($blogPost->images) {
            $nameArr = explode(',', $blogPost->images);
            foreach ($nameArr as $image) {
                $imgFile = 'blog-images/' . $image;
                if (file_exists($imgFile)) {
                    unlink($imgFile);
                }
            }
        }

        $blogPost->delete();

        return response()->json('deleted', 200);
    }
}
