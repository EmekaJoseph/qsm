<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Str;

use App\Models\MaterialModel;

class MaterialsController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function index(Request $req)
    {
        $materials = DB::table('tbl_material_categories')
            ->rightJoin('tbl_materials', 'tbl_material_categories.category_id', '=', 'tbl_materials.category_id')
            ->select(
                'material_id',
                'name',
                'category_name as category',
                'created_at',
                'material_code'
            )
            ->where('isArchived', '0')
            ->when(!empty($req->search), function ($query) use ($req) {
                return $query->where('name', 'like', "%{$req->search}%")
                    ->orWhere('material_code', 'like', "%{$req->search}%");
            })

            ->get();

        if (sizeof($materials) > 0) {
            foreach ($materials as $material) {
                $material->created = (Carbon::parse($material->created_at))->diffForHumans();
            }
        }

        $parPage = 20;
        $collection = collect($materials);
        $chunks = $collection->chunk($parPage);

        $thisChunk = $chunks;
        if (sizeof($chunks) > 0) {
            if (sizeof($chunks) < $req->page || ($req->page == 0))
                $thisChunk = [];
            else
                $thisChunk = ($chunks[$req->page - 1])->values();
        }


        return response()->json([
            'list' => $thisChunk,
            'total' => sizeof($materials),
            'perPage' => $parPage,
            'currPage' => $req->page,
        ]);
    }

    public function store(Request $req)
    {
        $name = $req->input('name');
        if (MaterialModel::where('name', $name)->exists()) {
            return response()->json('name already exists', 203);
        }

        $material = MaterialModel::create([
            'category_id' => $req->input('category_id'),
            'pages' => $req->input('pages'),
            'name' => $req->input('name'),
            'doc' => '',
            'material_code' => '',
        ]);

        if ($req->file('doc')) {
            $file = $req->file('doc');
            $fileName =  str_replace(' ', '_', $material->name) . time() . '.' . $file->extension();
            $file->move('course_materials/', $fileName);

            $material->doc = $fileName;
        }

        $material->material_code = 'M' .  random_int(1, 9) . $material->material_id .  random_int(10, 99);
        $material->save();

        return response()->json('saved', 200);
    }

    public function update($material_id, Request $req)
    {
        $material = MaterialModel::find($material_id);

        $material->category_id = $req->input('category_id');
        $material->pages = $req->input('pages');
        $material->name = $req->input('name');

        $material->save();

        return response()->json('updated', 200);
    }



    public function destroy(string $id)
    {
        $material = MaterialModel::find($id);

        if (!$material) {
            return response()->json('not found', 203);
        }

        if ($material->doc) {
            $doc = 'course_materials/' . $material->doc;
            if (file_exists($doc)) {
                unlink($doc);
            }
        }

        $material->delete();

        return response()->json('deleted', 200);
    }



    // #################### PINS START ########################### //
    public function generate_pin($material_id, $name)
    {
        $id = DB::table('tbl_material_otp')->insertGetId([
            'material_id' => $material_id,
            'name' => $name,
            'code' => 'QSM' . $material_id . strtoupper(Str::random(3)),
            'created_date' => Carbon::now()
        ]);

        $material = DB::table('tbl_material_otp')->find($id);

        return response()->json($material, 200);
    }

    public function view_pins()
    {
        $all = DB::table('tbl_material_otp')->get();
        return response()->json($all, 200);
    }

    public function delete_pin($id)
    {
        // DB::table('tbl_material_otp')->truncate();
        DB::table('tbl_material_otp')->where('id', $id)->delete();
        return response()->json('deleted', 200);
    }

    // #################### PINS END ########################### //




    // users

    public function latestMaterials()
    {

        $materials = DB::table('tbl_material_categories')
            ->rightJoin('tbl_materials', 'tbl_material_categories.category_id', '=', 'tbl_materials.category_id')
            ->select(
                'material_id as id',
                'name',
                'category_name as category',
                'pages',
            )
            ->where('isArchived', '0')

            ->limit(20)->get();

        return response()->json($materials, 200);
    }

    public function materialsByName($name)
    {
        $materials = DB::table('tbl_material_categories')
            ->rightJoin('tbl_materials', 'tbl_material_categories.category_id', '=', 'tbl_materials.category_id')
            ->select(
                'material_id as id',
                'name',
                'category_name as category',
                'pages',
            )
            ->where('isArchived', '0')
            ->when(!empty($name), function ($query) use ($name) {
                return $query->where('name', 'like', "%{$name}%");
            })

            ->get();
        return response()->json($materials, 200);
    }


    public function materialsByCategory($category_id)
    {
        $materials = DB::table('tbl_material_categories')
            ->rightJoin('tbl_materials', 'tbl_material_categories.category_id', '=', 'tbl_materials.category_id')
            ->select(
                'material_id as id',
                'name',
                'category_name as category',
                'pages',
            )
            ->where('isArchived', '0')
            ->where('tbl_materials.category_id', $category_id)

            ->get();
        return response()->json($materials, 200);
    }

    public function downloadMaterial($code)
    {
        $otp = DB::table('tbl_material_otp')->where('code', $code)->first();

        if (!$otp) {
            return response()->json('code invalid', 203);
        }

        $material = MaterialModel::find($otp->material_id);

        DB::table('tbl_material_otp')->where('code', $code)->delete();

        return response()->json($material->doc, 200);
    }
}
