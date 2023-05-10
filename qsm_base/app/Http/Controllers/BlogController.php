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
        $list =  BlogModel::select('blog_id', 'title', 'created_at', 'category', 'image')->orderByDesc('created_at')->get();
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
        if (!$blogPost)
            return response()->json('not found', 203);
        return response()->json($blogPost, 200);
    }


    public function updateBlog($blog_id, Request $req)
    {
        $title = $req->input('title');

        if (BlogModel::whereNot('blog_id', $blog_id)->where('title', $title)->exists()) {
            return response()->json('title already exists', 203);
        }

        $thisBlog = BlogModel::find($blog_id);

        $thisBlog->title = $req->input('title');
        $thisBlog->body = $req->input('body');
        $thisBlog->category = $req->input('category');


        if ($req->file('image')) {
            try {

                // delete the image from clodinary ##############################
                if ($thisBlog->image) Cloudinary::destroy($thisBlog->image);
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
