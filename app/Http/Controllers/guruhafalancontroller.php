<?php

namespace App\Http\Controllers;

use App\Helpers\Fungsi;
use App\Models\hafalan;
use App\Models\hafalanadm;
use App\Models\siswa;
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

        return view('pages.guru.hafalan.index', compact('datas', 'request', 'pages'));
    }
    public function cari(Request $request)
    {

        $cari = $request->cari;
        #WAJIB
        $pages = 'hafalan';
        $datas = DB::table('hafalan')
            ->where('nama', 'like', "%" . $cari . "%")
            ->paginate(Fungsi::paginationjml());

        return view('pages.guru.hafalan.index', compact('datas', 'request', 'pages'));
    }
    public function create()
    {
        $pages = 'hafalan';
        if (request()->has('kelas_id')) {
            $kelasId = request()->input('kelas_id');
        } else {
            // Nilai default jika kelas_id tidak ditemukan dalam permintaan
            $kelasId = 1; // atau nilai lainnya sesuai dengan kebutuhan
        }
        $surah = hafalanadm::with('kelas')->where('kelas_id', $kelasId)->get();
        $santri = siswa::all();

        return view('pages.guru.hafalan.create', compact('pages', 'surah', 'santri'));
    }

    public function store(Request $request)
    {
        $cek = DB::table('hafalan')
            ->where('santri_id', $request->nomerinduk)
            ->count();
        if ($cek > 0) {
            $request->validate(
                [
                    'santri_id' => 'required|unique:surah,santri_id',
                ]
            );
        }

        $request->validate(
            [
                'santri_id' => 'required',
                'surah' => 'required|min:1|max:100',
                'ayat' => 'required',

            ],
            [
                'santri_id.santri_id' => 'NIS harus diisi',
            ]
        );

        DB::table('hafalan')->insert(
            array(
                'santri_id'     =>   $request->nomerinduk,
                'tanggal'     =>   $request->tanggal,
                'tes'     =>   $request->tes,
                'surah_id'     =>   $request->surah_id,
                'ayat'     =>   $request->ayat,
                'makhroj'     =>   $request->makhroj,
                'tajwid'     =>   $request->tajwid,
                'nilai_hs'     =>   $request->nilai_hs,
                'nilai_kb'     =>   $request->nilai_kb,
                'created_at' => date("Y-m-d H:i:s"),
                'updated_at' => date("Y-m-d H:i:s")
            )
        );
        // return redirect()->route('sync.mapeltodataajar')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }

    public function edit(hafalan $id)
    {
        $pages = 'hafalan';

        //$tipepelajaran = DB::table('kategori')->where('prefix', 'tipepelajaran')->get();
        return view('pages.guru.hafalan.edit', compact('pages', 'id'));
    }
    public function update(hafalan $id, Request $request)
    {

        if ($request->nomerinduk !== $id->nomerinduk) {

            $request->validate(
                [
                    'nomerinduk' => "required",
                ],
                []
            );
        }

        $request->validate(
            [
                'nomerinduk' => 'required',
            ],
            [
                'nomerinduk.required' => 'nis harus diisi',
            ]
        );


        hafalan::where('id', $id->id)
            ->update([
                'santri_id'     =>   $request->nomerinduk,
                'tanggal'     =>   $request->tanggal,
                'tes'     =>   $request->tes,
                'surah_id'     =>   $request->surah_id,
                'ayat'     =>   $request->ayat,
                'makhroj'     =>   $request->makhroj,
                'tajwid'     =>   $request->tajwid,
                'nilai_hs'     =>   $request->nilai_hs,
                'nilai_kb'     =>   $request->nilai_kb,
                'updated_at' => date("Y-m-d H:i:s")
            ]);
        // return redirect()->route('sync.mapeltodataajar')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }
    public function destroy(hafalan $id)
    {

        hafalan::destroy($id->id);
        return redirect()->route('guru.hafalan')->with('status', 'Data berhasil dihapus!')->with('tipe', 'warning')->with('icon', 'fas fa-feather');
    }

    public function multidel(Request $request)
    {

        $ids = $request->ids;
        hafalan::whereIn('id', $ids)->delete();

        // load ulang
        #WAJIB
        $pages = 'hafalan';
        $datas = hafalan::paginate(Fungsi::paginationjml());

        return view('pages.guru.hafalan.index', compact('datas', 'request', 'pages'));
    }
}
