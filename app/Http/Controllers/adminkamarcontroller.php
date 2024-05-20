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
        $datas = DB::table('kamar')
            ->paginate(Fungsi::paginationjml());

        return view('pages.admin.kamar.index', compact('datas', 'request', 'pages'));
    }
    public function cari(Request $request)
    {

        $cari = $request->cari;
        #WAJIB
        $pages = 'kamar';
        $datas = DB::table('kamar')
            ->where('nama', 'like', "%" . $cari . "%")
            ->paginate(Fungsi::paginationjml());

        return view('pages.admin.kamar.index', compact('datas', 'request', 'pages'));
    }

    public function create()
    {
        $pages = 'kamar';
        return view('pages.admin.kamar.edit', compact('pages'));
    }

    public function store(Request $request)
    {
        $cek = DB::table('kamar')
            ->where('nama', $request->nama)
            ->count();
        if ($cek > 0) {
            $request->validate(
                [
                    'nama' => 'required|unique:kamar,nama',
                ],
                [
                    'nama.unique' => 'nama sudah digunakan',
                ]
            );
        }

        $request->validate(
            [
                'nama' => 'required',
                'kategori' => 'required|min:1|max:100',
                'status' => 'required',

            ],
            [
                'nama.nama' => 'Nama Kamar harus diisi',
            ]
        );

        DB::table('kamar')->insert(
            array(
                'nama'     =>   $request->nama,
                'kategori'     =>   $request->kategori,
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
        return view('pages.admin.kamar.edit', compact('pages', 'id'));
    }

    public function update(kamar $id, Request $request)
    {

        if ($request->nama !== $id->nama) {

            $request->validate(
                [
                    'nama' => "required",
                ],
                []
            );
        }

        $request->validate(
            [
                'nama' => 'required',
            ],
            [
                'nama.required' => 'nama kamar harus diisi',
            ]
        );


        kamar::where('id', $id->id)
            ->update([
                'nama'     =>   $request->nama,
                'kategori'     =>   $request->kategori,
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
