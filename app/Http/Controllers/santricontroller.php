<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\siswa;
use App\Models\kelas;

class santricontroller extends Controller
{
    public function getDataByNIS($nis)
    {
        // Ambil data siswa dari tabel siswa berdasarkan NIS
        $siswa = Siswa::where('nomerinduk', $nis)->first();

        // Jika data siswa ditemukan
        if ($siswa) {
            // Mendapatkan informasi kelas siswa
            $kelas = kelas::find($siswa->kelas_id);

            // Jika data kelas ditemukan
            if ($kelas) {
                return response()->json([
                    'nama' => $siswa->nama,
                    'kelas_id' => $kelas->tingkatan,
                    // tambahkan field lain yang diperlukan di sini
                ]);
            } else {
                // Jika data kelas tidak ditemukan
                return response()->json([
                    'error' => 'Data kelas siswa tidak ditemukan'
                ], 404); // Contoh kode status 404 untuk data tidak ditemukan
            }
        } else {
            // Jika data siswa tidak ditemukan
            return response()->json([
                'error' => 'Data siswa tidak ditemukan'
            ], 404); // Contoh kode status 404 untuk data tidak ditemukan
        }
    }
}
