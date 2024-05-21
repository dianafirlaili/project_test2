<?php

namespace App\Http\Controllers;

use App\Helpers\Fungsi;
use App\Models\hafalan;
use App\Models\kelas;
use App\Models\surah;
use App\Models\siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class adminhafalancontroller extends Controller
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
        $pages = 'hafalan';
        $datas = hafalan::paginate(Fungsi::paginationjml());
        $kelas = kelas::get();

        return view('pages.admin.hafalan.index', compact('datas', 'request', 'pages', 'kelas'));
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
        $surah = Surah::all();
        $tipepelajaran = DB::table('kategori')->where('prefix', 'tipepelajaran')->get();

        return view('pages.admin.hafalan.create', compact('pages', 'tipepelajaran', 'surah'));
    }

    public function store(Request $request)
    {
        // Lakukan pengecekan apakah data dengan nama tersebut sudah ada dalam database
        $existingSantri = DB::table('santri')
            ->where('nama', $request->nama)
            ->first();

        // Jika data dengan nama tersebut sudah ada, isi input santri_id dengan ID yang sesuai
        if ($existingSantri) {
            $request->merge(['santri_id' => $existingSantri->id]);
        }

        // Validasi data yang diterima dari formulir
        $request->validate([
            'santri_id' => 'required',
            'nilai_hs' => 'required|min:1|max:100',
            'nilai_kb' => 'required',
            // Sesuaikan aturan validasi lainnya sesuai kebutuhan Anda
        ]);

        // Simpan data ke dalam database
        DB::table('hafalan')->insert([
            'santri_id' => $request->santri_id ?? null, // Gunakan nilai yang diisi otomatis atau null jika tidak ada
            'tanggal' => $request->tanggal,
            'tes' => $request->tes,
            'surah_id' => $request->surah_id,
            'ayat' => $request->ayat,
            'makhroj' => $request->makhroj,
            'tajwid' => $request->tajwid,
            'nilai_hs' => $request->nilai_hs,
            'nilai_kb' => $request->nilai_kb,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        // Redirect atau berikan respon sesuai kebutuhan aplikasi Anda
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


        // return redirect()->route('sync.mapeltodataajar')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
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
