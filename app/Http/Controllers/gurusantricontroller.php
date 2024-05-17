<?php

namespace App\Http\Controllers;

use App\Helpers\Fungsi;
use App\Models\kelas;
use App\Models\siswa;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class gurusantricontroller extends Controller
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
        $pages = 'santri';
        $datas = siswa::with('users')->with('kelas')
            ->paginate(Fungsi::paginationjml());
        $kelas = kelas::get();
        // dd($datas);

        return view('pages.guru.santri.index', compact('datas', 'request', 'pages', 'kelas'));
    }
    public function cari(Request $request)
    {

        $cari = $request->cari;
        #WAJIB
        $pages = 'santri';
        $datas = siswa::with('users')
            ->where('nama', 'like', "%" . $cari . "%")
            ->orWhere('nomerinduk', 'like', "%" . $cari . "%")
            ->paginate(Fungsi::paginationjml());

        $kelas = kelas::get();
        return view('pages.guru.santri.index', compact('datas', 'request', 'pages', 'kelas'));
    }

    public function reset(siswa $id)
    {
        // dd($siswa);

        User::where('nomerinduk', $id->nis)
            ->update([
                'password' => Hash::make(Fungsi::passdefaultsiswa()),
                'updated_at' => date("Y-m-d H:i:s")
            ]);

        return redirect()->back()->with('status', 'Reset berhasil! Password baru : ' . Fungsi::passdefaultsiswa() . '')->with('tipe', 'success')->with('icon', 'fas fa-edit');
    }
}
