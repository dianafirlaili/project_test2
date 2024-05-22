<?php

use App\Http\Controllers\adminabsensicontroller;
use App\Http\Controllers\adminapicontroller;
use App\Http\Controllers\adminbanksoalcontroller;
use App\Http\Controllers\admindashboardcontroller;
use App\Http\Controllers\admingeneratebanksoalcontroller;
use App\Http\Controllers\admingurucontroller;
use App\Http\Controllers\adminkelascontroller;
use App\Http\Controllers\adminkompetensidasarcontroller;
use App\Http\Controllers\adminkamarcontroller;
use App\Http\Controllers\adminhafalancontroller;
use App\Http\Controllers\adminmapelcontroller;
use App\Http\Controllers\adminmateripokokcontroller;
use App\Http\Controllers\adminpelanggarancontroller;
use App\Http\Controllers\adminpenilaiancontroller;
use App\Http\Controllers\adminprosescontroller;
use App\Http\Controllers\adminseedercontroller;
use App\Http\Controllers\adminsettingscontroller;
use App\Http\Controllers\adminsilabuscontroller;
use App\Http\Controllers\adminsantricontroller;
// use App\Http\Controllers\adminsiswacontroller;
use App\Http\Controllers\adminsynccontroller;
use App\Http\Controllers\admintapelcontroller;
use App\Http\Controllers\adminuserscontroller;
use App\Http\Controllers\UserController;

use App\Http\Controllers\adminkkocontroller;
use App\Http\Controllers\adminpembayarancontroller;
use App\Http\Controllers\admintagihancontroller;
use App\Http\Controllers\guruabsensicontroller;
use App\Http\Controllers\gurukelascontroller;
use App\Http\Controllers\guruhafalancontroller;
use App\Http\Controllers\gurusantricontroller;
use App\Http\Controllers\gurukompetensidasarcontroller;
use App\Http\Controllers\gurumateripokokcontroller;
use App\Http\Controllers\gurupelanggarancontroller;
use App\Http\Controllers\gurupenilaiancontroller;
use App\Http\Controllers\gurusilabuscontroller;
use App\Http\Controllers\siswadataajarcontroller;
use App\Http\Controllers\siswaekskulcontroller;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;


Route::get('/', function () {
    return view('login');
});


//halaman admin fixed
Route::group(['middleware' => ['auth:web', 'verified']], function () {

    //DASHBOARD-MENU
    Route::get('/dashboard', [admindashboardcontroller::class, 'index'])->name('dashboard');

    //MASTERING
    //USER
    Route::get('/admin/users', [adminuserscontroller::class, 'index'])->name('users');
    Route::get('/admin/users/{id}', [adminuserscontroller::class, 'edit'])->name('users.edit');
    Route::put('/admin/users/{id}', [adminuserscontroller::class, 'update'])->name('users.update');
    Route::delete('/admin/users/{id}', [adminuserscontroller::class, 'destroy'])->name('users.destroy');
    Route::get('/admin/datausers/cari', [adminuserscontroller::class, 'cari'])->name('users.cari');
    Route::get('/admin/datausers/create', [adminuserscontroller::class, 'create'])->name('users.create');
    Route::post('/admin/datausers', [adminuserscontroller::class, 'store'])->name('users.store');
    Route::delete('/admin/datausers/multidel', [adminuserscontroller::class, 'multidel'])->name('users.multidel');

    //tapel
    Route::get('/admin/tapel', [admintapelcontroller::class, 'index'])->name('tapel');
    Route::get('/admin/tapel/{id}', [admintapelcontroller::class, 'edit'])->name('tapel.edit');
    Route::put('/admin/tapel/{id}', [admintapelcontroller::class, 'update'])->name('tapel.update');
    Route::delete('/admin/tapel/{id}', [admintapelcontroller::class, 'destroy'])->name('tapel.destroy');
    Route::get('/admin/datatapel/cari', [admintapelcontroller::class, 'cari'])->name('tapel.cari');
    Route::get('/admin/datatapel/create', [admintapelcontroller::class, 'create'])->name('tapel.create');
    Route::post('/admin/datatapel', [admintapelcontroller::class, 'store'])->name('tapel.store');
    Route::delete('/admin/datatapel/multidel', [admintapelcontroller::class, 'multidel'])->name('tapel.multidel');


    //guru
    Route::get('/admin/guru', [admingurucontroller::class, 'index'])->name('guru');
    Route::get('/admin/guru/{id}', [admingurucontroller::class, 'edit'])->name('guru.edit');
    Route::put('/admin/guru/{id}', [admingurucontroller::class, 'update'])->name('guru.update');
    Route::delete('/admin/guru/{id}', [admingurucontroller::class, 'destroy'])->name('guru.destroy');
    Route::get('/admin/dataguru/cari', [admingurucontroller::class, 'cari'])->name('guru.cari');
    Route::get('/admin/dataguru/create', [admingurucontroller::class, 'create'])->name('guru.create');
    Route::post('/admin/dataguru', [admingurucontroller::class, 'store'])->name('guru.store');
    Route::delete('/admin/dataguru/multidel', [admingurucontroller::class, 'multidel'])->name('guru.multidel');


    //kelas
    Route::get('/admin/kelas', [adminkelascontroller::class, 'index'])->name('kelas');
    Route::get('/admin/kelas/{id}', [adminkelascontroller::class, 'edit'])->name('kelas.edit');
    Route::put('/admin/kelas/{id}', [adminkelascontroller::class, 'update'])->name('kelas.update');
    Route::delete('/admin/kelas/{id}', [adminkelascontroller::class, 'destroy'])->name('kelas.destroy');
    Route::get('/admin/datakelas/cari', [adminkelascontroller::class, 'cari'])->name('kelas.cari');
    Route::get('/admin/datakelas/create', [adminkelascontroller::class, 'create'])->name('kelas.create');
    Route::post('/admin/datakelas', [adminkelascontroller::class, 'store'])->name('kelas.store');
    Route::delete('/admin/datakelas/multidel', [adminkelascontroller::class, 'multidel'])->name('kelas.multidel');
    //walikelas
    Route::post('/admin/store/walikelas/{id}', [adminkelascontroller::class, 'walikelasstore'])->name('store.walikelas');
    Route::post('/admin/store/pengajar/{id}', [adminsilabuscontroller::class, 'pengajarstore'])->name('store.pengajar');


    //santri
    Route::get('/admin/santri', [adminsantricontroller::class, 'index'])->name('santri');
    Route::get('/admin/santri/{id}', [adminsantricontroller::class, 'edit'])->name('santri.edit');
    Route::post('/admin/santri/{id}/reset', [adminsantricontroller::class, 'reset'])->name('santri.reset');
    Route::put('/admin/santri/{id}', [adminsantricontroller::class, 'update'])->name('santri.update');
    Route::delete('/admin/santri/{id}', [adminsantricontroller::class, 'destroy'])->name('santri.destroy');
    Route::get('/admin/datasantri/cari', [adminsantricontroller::class, 'cari'])->name('santri.cari');
    Route::get('/admin/datasantri/create', [adminsantricontroller::class, 'create'])->name('santri.create');
    Route::post('/admin/datasantri', [adminsantricontroller::class, 'store'])->name('santri.store');
    Route::delete('/admin/datasantri/multidel', [adminsantricontroller::class, 'multidel'])->name('santri.multidel');


    //kamar
    Route::get('/admin/kamar', [adminkamarcontroller::class, 'index'])->name('kamar');
    Route::get('/admin/kamar/{id}', [adminkamarcontroller::class, 'edit'])->name('kamar.edit');
    Route::put('/admin/kamar/{id}', [adminkamarcontroller::class, 'update'])->name('kamar.update');
    Route::delete('/admin/kamar/{id}', [adminkamarcontroller::class, 'destroy'])->name('kamar.destroy');
    Route::get('/admin/datakamar/cari', [adminkamarcontroller::class, 'cari'])->name('kamar.cari');
    Route::get('/admin/datakamar/create', [adminkamarcontroller::class, 'create'])->name('kamar.create');
    Route::post('/admin/datakamar', [adminkamarcontroller::class, 'store'])->name('kamar.store');
    Route::delete('/admin/datakamar/multidel', [adminkamarcontroller::class, 'multidel'])->name('kamar.multidel');


    //hafalan
    Route::get('/admin/hafalan', [adminhafalancontroller::class, 'index'])->name('hafalan');
    Route::get('/admin/hafalan/{id}', [adminhafalancontroller::class, 'edit'])->name('hafalan.edit');
    Route::put('/admin/hafalan/{id}', [adminhafalancontroller::class, 'update'])->name('hafalan.update');
    Route::delete('/admin/hafalan/{id}', [adminhafalancontroller::class, 'destroy'])->name('hafalan.destroy');
    Route::get('/admin/datahafalan/cari', [adminhafalancontroller::class, 'cari'])->name('hafalan.cari');
    Route::get('/admin/datahafalan/create', [adminhafalancontroller::class, 'create'])->name('hafalan.create');
    Route::post('/admin/datahafalan', [adminhafalancontroller::class, 'store'])->name('hafalan.store');
    Route::delete('/admin/datahafalan/multidel', [adminhafalancontroller::class, 'multidel'])->name('hafalan.multidel');
    //Route::get('/admin/datahafalan/{id}', [adminhafalancontroller::class, 'hafalan.show']);




    //mapel
    Route::get('/admin/mapel', [adminmapelcontroller::class, 'index'])->name('mapel');
    Route::get('/admin/mapel/{id}', [adminmapelcontroller::class, 'edit'])->name('mapel.edit');
    Route::put('/admin/mapel/{id}', [adminmapelcontroller::class, 'update'])->name('mapel.update');
    Route::delete('/admin/mapel/{id}', [adminmapelcontroller::class, 'destroy'])->name('mapel.destroy');
    Route::get('/admin/datamapel/cari', [adminmapelcontroller::class, 'cari'])->name('mapel.cari');
    Route::get('/admin/datamapel/create', [adminmapelcontroller::class, 'create'])->name('mapel.create');
    Route::post('/admin/datamapel', [adminmapelcontroller::class, 'store'])->name('mapel.store');
    Route::delete('/admin/datamapel/multidel', [adminmapelcontroller::class, 'multidel'])->name('mapel.multidel');


    //penilaian
    Route::get('/admin/penilaian', [adminpenilaiancontroller::class, 'index'])->name('penilaian');
    Route::get('/admin/datapenilaian/cari', [adminpenilaiancontroller::class, 'cari'])->name('penilaian.cari');
    //inputnilai
    Route::get('/admin/datapenilaian/inputnilai/{dataajar}', [adminpenilaiancontroller::class, 'inputnilai'])->name('penilaian.inputnilai');
    //export
    Route::get('/admin/datapenilaianexportmateripokok/{dataajar}/materipokok/{materipokok}', [adminpenilaiancontroller::class, 'exportnilaipermateri'])->name('penilaian.inputnilai.exportmateripokok');
    Route::get('/admin/datapenilaianexportkd/{dataajar}/kd/{kompetensidasar}', [adminpenilaiancontroller::class, 'exportnilaiperkd'])->name('penilaian.inputnilai.exportkd');
    //import
    Route::post('admin/datapenilaianimportmateri/{dataajar}/materi/{materipokok}', [adminpenilaiancontroller::class, 'importnilaipermateri'])->name('penilaian.inpunilai.importnilaipermateri');


    // api
    Route::get('/api/admin/inputnilai/store/{dataajar}', [adminapicontroller::class, 'inputnilaistore'])->name('api.admin.inputnilai.store');
    Route::get('/api/admin/siswaperkelas/{kelas}', [adminapicontroller::class, 'siswaperkelas'])->name('api.admin.siswaperkelas');
    Route::get('/api/admin/banksoal/periksatingkatkesulitan', [adminapicontroller::class, 'periksatingkatkesulitan'])->name('api.banksoal.periksatingkatkesulitan');

    Route::get('/api/admin/banksoal/kompetensidasargeneratekode/{dataajar}', [adminapicontroller::class, 'kompetensidasargeneratekode'])->name('api.banksoal.kompetensidasargeneratekode');

    //sync
    Route::get('/admin/sync/mapeltodataajar', [adminsynccontroller::class, 'mapeltodataajar'])->name('sync.mapeltodataajar');
    Route::get('/admin/sync/tagihantodetail', [adminsynccontroller::class, 'tagihantodetail'])->name('sync.tagihantodetail');

    //Seeder
    Route::post('/admin/seeder/kelas', [adminseedercontroller::class, 'kelas'])->name('seeder.kelas');
    Route::post('/admin/seeder/siswa', [adminseedercontroller::class, 'siswa'])->name('seeder.siswa');
    Route::post('/admin/seeder/guru', [adminseedercontroller::class, 'guru'])->name('seeder.guru');
    Route::post('/admin/seeder/mapel', [adminseedercontroller::class, 'mapel'])->name('seeder.mapel');
    Route::post('/admin/seeder/hard', [adminseedercontroller::class, 'hard'])->name('seeder.hard');

    //proseslainlain
    Route::post('/admin/proses/cleartemp', [adminprosescontroller::class, 'cleartemp'])->name('cleartemp');


    // hakakses guru
    //kelas
    Route::get('/guru/kelas', [gurukelascontroller::class, 'index'])->name('guru.kelas');
    Route::get('/guru/datakelas/cari', [gurukelascontroller::class, 'cari'])->name('guru.kelas.cari');

    //santri
    Route::get('/guru/santri', [gurusantricontroller::class, 'index'])->name('guru.santri');
    Route::get('/guru/datasantri/cari', [gurusantricontroller::class, 'cari'])->name('guru.santri.cari');

    //hafalan
    Route::get('/guru/hafalan', [guruhafalancontroller::class, 'index'])->name('guru.hafalan');
    Route::get('/guru/hafalan/{id}', [guruhafalancontroller::class, 'edit'])->name('guru.hafalan.edit');
    Route::put('/guru/hafalan/{id}', [guruhafalancontroller::class, 'update'])->name('guru.hafalan.update');
    Route::delete('/guru/hafalan/{id}', [guruhafalancontroller::class, 'destroy'])->name('guru.hafalan.destroy');
    Route::get('/guru/datahafalan/cari', [guruhafalancontroller::class, 'cari'])->name('guru.hafalan.cari');
    Route::get('/guru/datahafalan/create', [guruhafalancontroller::class, 'create'])->name('guru.hafalan.create');
    Route::post('/guru/datahafalan', [guruhafalancontroller::class, 'store'])->name('guru.hafalan.store');
    Route::delete('/guru/datahafalan/multidel', [guruhafalancontroller::class, 'multidel'])->name('guru.hafalan.multidel');
    Route::get('/santri/{nis}', 'santricontroller@getDataByNIS');



    //penilaian
    Route::get('/guru/penilaian', [gurupenilaiancontroller::class, 'index'])->name('guru.penilaian');
    Route::get('/guru/datapenilaian/cari', [gurupenilaiancontroller::class, 'cari'])->name('guru.penilaian.cari');

    //inputnilai
    Route::get('/guru/datapenilaian/inputnilai/{dataajar}', [gurupenilaiancontroller::class, 'inputnilai'])->name('guru.penilaian.inputnilai');

    //menusiswa

    Route::put('/menusiswa/siswa/{id}', [admindashboardcontroller::class, 'siswaupdate'])->name('siswa.siswa.update');

    Route::get('/menusiswa/dataajar', [siswadataajarcontroller::class, 'index'])->name('menusiswa.dataajar');
    Route::get('/menusiswa/penilaian', [siswadataajarcontroller::class, 'lihatnilai'])->name('menusiswa.lihatnilai');
    Route::get('/menusiswa/detailpenilaian/{dataajar}', [siswadataajarcontroller::class, 'detailpenilaian'])->name('menusiswa.detailpenilaian');
    Route::get('/menusiswa/eksul', [siswaekskulcontroller::class, 'index'])->name('menusiswa.ekskul');
    Route::get('/gumenusiswaru/dataajar/cari', [siswadataajarcontroller::class, 'cari'])->name('menusiswa.dataajar.cari');

    Route::get('/menusiswa/materi/{dataajar}', [siswadataajarcontroller::class, 'materi'])->name('menusiswa.materi');
    Route::get('/menusiswa/materi/{dataajar}/detail/{kd}', [siswadataajarcontroller::class, 'materidetail'])->name('menusiswa.materi.detail');
});
