<?php

namespace App\Http\Controllers;

use App\Helpers\Fungsi;
use App\Models\kamar;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class adminkamarcontroller extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            if (Auth::user()->tipeuser != 'admin') {
                return redirect()->route('dashboard')->with('status', 'Halaman tidak ditemukan!')->with('tipe', 'danger');
            }

            return $next($request);
        });
    }
    public function index(Request $request)
    {
        #WAJIB
        $pages = 'kamar';
        $datas = kamar::paginate(Fungsi::paginationjml());

        return view('pages.admin.kamar.index', compact('datas', 'request', 'pages'));
    }
    public function cari(Request $request)
    {

        $cari = $request->cari;
        #WAJIB
        $pages = 'kamar';
        $datas = DB::table('kamar')
            ->where('nokamar', 'like', "%" . $cari . "%")
            ->paginate(Fungsi::paginationjml());

        return view('pages.admin.kamar.index', compact('datas', 'request', 'pages'));
    }
    public function create()
    {
        $pages = 'kamar';

        $tipepelajaran = DB::table('kategori')->where('prefix', 'tipepelajaran')->get();

        return view('pages.admin.kamar.create', compact('pages', 'tipepelajaran'));
    }

    public function store(Request $request)
    {
        $cek = DB::table('kamar')
            ->where('nokamar', $request->nokamar)
            ->count();
        if ($cek > 0) {
            $request->validate(
                [
                    'nokamar' => 'required|unique:kamar,nokamar',
                ],
                [
                    'nokamar.unique' => 'nokamar sudah digunakan',
                ]
            );
        }

        $request->validate(
            [
                'nokamar' => 'required',
                'kapasitas' => 'required|min:1|max:100',
                'status' => 'required',

            ],
            [
                'nokamar.nokamar' => 'No kamar harus diisi',
            ]
        );

        DB::table('kamar')->insert(
            array(
                'nokamar'     =>   $request->nokamar,
                'kapasitas'     =>   $request->kapasitas,
                'status'     =>   $request->status,
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s")
            )
        );
        //return redirect()->route('sync.mapeltodataajar')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }

    public function edit(kamar $id)
    {
        $pages = 'kamar';

        $tipepelajaran = DB::table('kategori')->where('prefix', 'tipepelajaran')->get();
        return view('pages.admin.kamar.edit', compact('pages', 'id', 'tipepelajaran'));
    }
    public function update(kamar $id, Request $request)
    {

        if ($request->nokamar !== $id->nokamar) {

            $request->validate(
                [
                    'nokamar' => "required",
                ],
                []
            );
        }

        $request->validate(
            [
                'nokamar' => 'required',
            ],
            [
                'nokamar.required' => 'nokamar harus diisi',
            ]
        );


        kamar::where('id', $id->id)
            ->update([
                'nokamar'     =>   $request->nokamar,
                'kapaitas'     =>   $request->kapasitas,
                'status'     =>   $request->status,
                'updated_at' => date("Y-m-d H:i:s")
            ]);
        //return redirect()->route('sync.mapeltodataajar')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }
    public function destroy(kamar $id)
    {

        kamar::destroy($id->id);
        return redirect()->route('kamar')->with('status', 'Data berhasil dihapus!')->with('tipe', 'warning')->with('icon', 'fas fa-feather');
    }

    public function multidel(Request $request)
    {

        $ids = $request->ids;
        kamar::whereIn('id', $ids)->delete();

        // load ulang
        #WAJIB
        $pages = 'kamar';
        $datas = kamar::paginate(Fungsi::paginationjml());

        return view('pages.admin.kamar.index', compact('datas', 'request', 'pages'));
    }
}
