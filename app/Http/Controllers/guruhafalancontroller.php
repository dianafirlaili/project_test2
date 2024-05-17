<?php

namespace App\Http\Controllers;

use App\Helpers\Fungsi;
use App\Models\hafalan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class guruhafalancontroller extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            if (Auth::user()->tipeuser != 'guru') {
                return redirect()->route('dashboard')->with('status', 'Halaman tidak ditemukan!')->with('tipe', 'danger');
            }

            return $next($request);
        });
    }
    public function index(Request $request)
    {
        #WAJIB
        $pages = 'hafalan';
        $datas = hafalan::paginate(Fungsi::paginationjml());

        return view('pages.admin.hafalan.index', compact('datas', 'request', 'pages'));
    }
    public function cari(Request $request)
    {

        $cari = $request->cari;
        #WAJIB
        $pages = 'hafalan';
        $datas = DB::table('hafalan')
            ->where('nama', 'like', "%" . $cari . "%")
            ->paginate(Fungsi::paginationjml());

        return view('pages.admin.hafalan.index', compact('datas', 'request', 'pages'));
    }
    public function create()
    {
        $pages = 'hafalan';

        $tipepelajaran = DB::table('kategori')->where('prefix', 'tipepelajaran')->get();

        return view('pages.admin.hafalan.create', compact('pages', 'tipepelajaran'));
    }

    public function store(Request $request)
    {
        $cek = DB::table('hafalan')
            ->where('nama', $request->nama)
            ->count();
        if ($cek > 0) {
            $request->validate(
                [
                    'nama' => 'required|unique:mapel,nama',
                ],
                [
                    'nama.unique' => 'nama sudah digunakan',
                ]
            );
        }

        $request->validate(
            [
                'nama' => 'required',
                'kkm' => 'required|min:1|max:100',
                'tipe' => 'required',

            ],
            [
                'nama.nama' => 'Nama harus diisi',
            ]
        );

        DB::table('hafalan')->insert(
            array(
                'nama'     =>   $request->nama,
                'tipe'     =>   $request->tipe,
                'tingkatan'     =>   $request->tingkatan,
                'jurusan'     =>   $request->jurusan,
                'kkm'     =>   $request->kkm,
                'semester'     =>   $request->semester,
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s")
            )
        );



        return redirect()->route('sync.mapeltodataajar')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }

    public function edit(hafalan $id)
    {
        $pages = 'hafalan';

        $tipepelajaran = DB::table('kategori')->where('prefix', 'tipepelajaran')->get();
        return view('pages.admin.hafalan.edit', compact('pages', 'id', 'tipepelajaran'));
    }
    public function update(hafalan $id, Request $request)
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
                'nama.required' => 'nama harus diisi',
            ]
        );


        hafalan::where('id', $id->id)
            ->update([
                'nama'     =>   $request->nama,
                'tipe'     =>   $request->tipe,
                'tingkatan'     =>   $request->tingkatan,
                'jurusan'     =>   $request->jurusan,
                'kkm'     =>   $request->kkm,
                'semester'     =>   $request->semester,
                'updated_at' => date("Y-m-d H:i:s")
            ]);


        return redirect()->route('sync.mapeltodataajar')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }
    public function destroy(hafalan $id)
    {

        hafalan::destroy($id->id);
        return redirect()->route('hafalan')->with('status', 'Data berhasil dihapus!')->with('tipe', 'warning')->with('icon', 'fas fa-feather');
    }

    public function multidel(Request $request)
    {

        $ids = $request->ids;
        hafalan::whereIn('id', $ids)->delete();

        // load ulang
        #WAJIB
        $pages = 'hafalan';
        $datas = hafalan::paginate(Fungsi::paginationjml());

        return view('pages.admin.hafalan.index', compact('datas', 'request', 'pages'));
    }
}
