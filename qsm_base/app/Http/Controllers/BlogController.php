<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

use App\Models\BlogModel;
use Carbon\Carbon;
use Illuminate\Contracts\Filesystem\Cloud;
use Illuminate\Support\Facades\DB;
use Intervention\Image\ImageManagerStatic as Image;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class BlogController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;


    public function index()
    {
        $list =  BlogModel::select('blog_id', 'title', 'created_at', 'category')->get();
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

        if (BlogModel::where('title', $title)->exists()) {
            return response()->json(['error' => 'title already exists'], 203);
        }

        $newBlog = new BlogModel();

        $newBlog->title = $title;
        $newBlog->body = $req->input('body');
        $newBlog->category = $req->input('category');
        // $imagePath = null;
        // $imagePublicId = null;

        if ($req->file('image')) {
            try {
                $result = $req->file('image')->storeOnCloudinaryAs('qsm_blog', 'blog_' . time());
                $imagePath = $result->getSecurePath();
                $imagePublicId = $result->getPublicId();

                $newBlog->image = $imagePath;
                $newBlog->imagePublicId = $imagePublicId;
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
        return response()->json($blogPost, 200);
    }


    public function updateDetails($id, Request $req)
    {


        $title = $req->input('title');

        if (BlogModel::whereNot('$id', $id)->where('title', $title)->exists()) {
            return response()->json('title already exists', 203);
        }

        $thisBlog = BlogModel::find($id);

        $thisBlog->title = $req->input('body');
        $thisBlog->body = $req->input('body');
        $thisBlog->category = $req->input('category');


        if ($req->file('image')) {
            try {

                // delete the image from clodinary ##############################

                $result = $req->file('image')->storeOnCloudinaryAs('qsm_blog', 'blog_' . time());
                $imagePath = $result->getSecurePath();
                $imagePublicId = $result->getPublicId();

                $thisBlog->image = $imagePath;
                $thisBlog->imagePublicId = $imagePublicId;
            } catch (\Throwable $th) {
                //throw $th;
            }
        }

        $thisBlog->save();

        return response()->json('updated', 200);
    }


    public function destroy(string $id)
    {
        $blogPost = BlogModel::find($id);
        try {
            //    delete image from cloudinary #####################################
        } catch (\Throwable $th) {
            //throw $th;
        }
        return response()->json($blogPost->delete(), 200);
    }
}
