<?php

namespace App\Http\Controllers;

use App\Helpers\Fungsi;
use App\Models\hafalanadm;
use App\Models\kelas;
use App\Models\surah;
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
        $pages = 'hafalan';
        $datas = hafalanadm::with('kelas')
            ->orderBy('kelas_id', 'asc')
            ->paginate(Fungsi::paginationjml());
        $kelas = kelas::get();

        return view('pages.admin.hafalan.index', compact('datas', 'request', 'pages', 'kelas'));
    }
    public function cari(Request $request)
    {

        $cari = $request->cari;
        #WAJIB
        $pages = 'hafalan';
        $datas = DB::table('hafalanadm')
            ->where('kelas_id', 'like', "%" . $cari . "%")
            ->paginate(Fungsi::paginationjml());

        return view('pages.admin.hafalan.index', compact('datas', 'request', 'pages'));
    }
    public function create()
    {
        $pages = 'hafalan';
        $surah = Surah::all();
        $kelas = kelas::orderBy('tingkatan')->get();
        //$tipepelajaran = DB::table('kategori')->where('prefix', 'tipepelajaran')->get();

        return view('pages.admin.hafalan.create', compact('pages', 'surah', 'kelas'));
    }

    public function store(Request $request)
    {
        // Lakukan pengecekan apakah data dengan nama tersebut sudah ada dalam database
        $existingSurah = DB::table('hafalanadm')
            ->where('kelas_id', $request->kelas_id)
            ->first();

        // Jika data dengan nama tersebut sudah ada, isi input santri_id dengan ID yang sesuai
        if ($existingSurah) {
            $request->merge(['id' => $existingSurah->id]);
        }

        // Validasi data yang diterima dari formulir
        $request->validate([
            'surah' => 'required',
            'kelas_id' => 'required',
            // Sesuaikan aturan validasi lainnya sesuai kebutuhan Anda
        ]);

        // Simpan data ke dalam database
        DB::table('hafalanadm')->insert([
            'surah' => $request->surah, // Gunakan nilai yang diisi otomatis atau null jika tidak ada
            'kelas_id' => $request->kelas_id,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        // Redirect atau berikan respon sesuai kebutuhan aplikasi Anda
        return redirect()->route('hafalan')->with('status', 'Data berhasil tambahkan!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }


    public function edit(hafalanadm $id)
    {
        $pages = 'hafalan';
        $kelas = DB::table('kelas')->get();
        $k1 = DB::table('kelas')->where('id', $id->kelas_id)->get();

        //$surah = DB::table('hafalanadm')->where('kelas_id', 'surah')->get();
        return view('pages.admin.hafalan.edit', compact('pages', 'id', 'kelas', 'k1'));
    }
    public function update(hafalanadm $id, Request $request)
    {

        if ($request->kelas_id !== $id->kelas_id) {

            $request->validate(
                [
                    'kelas_id' => "required",
                ],
                []
            );
        }

        $request->validate(
            [
                'kelas_id' => 'required',
            ],
            [
                'kelas_id.required' => 'kelas harus diisi',
            ]
        );


        hafalanadm::where('id', $id->id)
            ->update([
                'kelas_id'     =>   $request->kelas_id,
                'surah'     =>   $request->surah,
                'updated_at' => date("Y-m-d H:i:s")
            ]);

        return redirect()->route('hafalan')->with('status', 'Data berhasil tambahkan!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
        // return redirect()->route('sync.mapeltodataajar')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }
    public function destroy(hafalanadm $id)
    {

        hafalanadm::destroy($id->id);
        return redirect()->route('hafalan')->with('status', 'Data berhasil dihapus!')->with('tipe', 'warning')->with('icon', 'fas fa-feather');
    }

    public function multidel(Request $request)
    {

        $ids = $request->ids;
        hafalanadm::whereIn('id', $ids)->delete();

        // load ulang
        #WAJIB
        $pages = 'hafalan';
        $datas = hafalanadm::paginate(Fungsi::paginationjml());

        return view('pages.admin.hafalan.index', compact('datas', 'request', 'pages'));
    }
}
