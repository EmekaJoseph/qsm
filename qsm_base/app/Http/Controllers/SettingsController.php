<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class SettingsController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function addCategory(Request $req)
    {
        DB::table('tbl_material_categories')
            ->updateOrInsert(
                ['category_name' => $req->input('category_name')],
                ['category_name' => $req->input('category_name')]
            );

        return response()->json('saved', 200);
    }


    public function getCategories()
    {
        $all = DB::table('tbl_material_categories')->get();
        return response()->json($all, 200);
    }



    public function renameCategory(Request $req)
    {
        DB::table('tbl_material_categories')
            ->where('category_id', $req->input('category_id'))
            ->update(['category_name' => $req->input('category_name')]);

        return response()->json('updated', 200);
    }

    public function deleteCategory($category_id)
    {
        DB::table('tbl_material_categories')->where('category_id', $category_id)->delete();

        return response()->json('deleted', 200);
    }
}
