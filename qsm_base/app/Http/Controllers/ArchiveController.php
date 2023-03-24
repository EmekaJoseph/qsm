<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\MaterialModel;
use Carbon\Carbon;

class ArchiveController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function store(Request $req)
    {

        $archive_name = $req->input('archive_name');

        if (DB::table('tbl_archives')->where('archive_name', $archive_name)->exists()) {
            return response()->json('name already exists', 203);
        }

        DB::table('tbl_archives')->insert([
            'archive_name' => $archive_name,
            'created' => Carbon::now()
        ]);

        return response()->json('saved', 200);
    }

    public function index()
    {
        $archives = DB::table('tbl_archives')->get();

        if (sizeof($archives) > 0) {
            foreach ($archives as $arch) {
                $arch->created = (Carbon::parse($arch->created))->diffForHumans();
            }
        }

        return response()->json($archives, 200);
    }

    public function update($archive_id, Request $req)
    {

        $archive_name = $req->input('archive_name');

        if (DB::table('tbl_archives')->whereNot('archive_id', $archive_id)
            ->where('archive_name', $archive_name)->exists()
        ) {
            return response()->json('name already exists', 203);
        }

        DB::table('tbl_archives')->where('archive_id', $archive_id)
            ->update(['archive_name' => $req->input('archive_name')]);

        return response()->json('updated', 200);
    }


    public function destroy($archive_id)
    {
        $archive =  DB::table('tbl_archives')->where('archive_id', $archive_id)->first();

        if ($archive) {
            if ($archive->count > 0) {
                return response()->json('not empty', 203);
            }
        }

        DB::table('tbl_archives')->where('archive_id', $archive_id)->delete();

        return response()->json('deleted', 200);
    }

    public function materialToArchive(Request $req)
    {
        // $req = archive_id, op_type, material_ids, newArchive_id

        $archive_id = $req->input('archive_id');
        $op_type = $req->input('op_type');
        $material_ids = explode(',', $req->input('material_ids'));

        if ($op_type == 'add') {

            MaterialModel::whereIn('material_id', $material_ids)->update(['isArchived' => $archive_id]);

            DB::table('tbl_archives')->where('archive_id', $archive_id)->increment('count', sizeof($material_ids));
        } else  if ($op_type == 'remove') {

            MaterialModel::whereIn('material_id', $material_ids)->update(['isArchived' => '0']);

            DB::table('tbl_archives')->where('archive_id', $archive_id)->decrement('count', sizeof($material_ids));
        } else  if ($op_type == 'move') {

            $newArchive_id = $req->input('move_to');
            MaterialModel::whereIn('material_id', $material_ids)->update(['isArchived' => $newArchive_id]);

            DB::table('tbl_archives')->where('archive_id', $archive_id)->decrement('count', sizeof($material_ids));

            DB::table('tbl_archives')->where('archive_id', $newArchive_id)->increment('count', sizeof($material_ids));
        }

        return response()->json('success', 200);
    }


    public function show($archive_id)
    {
        $materials = MaterialModel::where('isArchived', $archive_id)->get();
        return response()->json($materials, 200);
    }
}
