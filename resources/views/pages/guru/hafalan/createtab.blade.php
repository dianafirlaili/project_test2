@extends('layouts.default')

@section('title')
    Hafalan Santri
@endsection

@push('before-script')
    @if (session('status'))
        <x-sweetalertsession tipe="{{ session('tipe') }}" status="{{ session('status') }}" />
    @endif
@endpush


@section('content')
    <section class="section">
        <div class="section-header">
            <h1>@yield('title')</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('dashboard') }}">Beranda</a></div>
                <div class="breadcrumb-item"><a href="{{ route('guru.hafalan') }}">@yield('title')</a></div>
                <div class="breadcrumb-item">Tambah</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Kelola Hafalan Santri</h5>

                    <!-- Default Tabs -->
                    <ul class="nav nav-tabs d-flex" id="myTabjustified" role="tablist">
                        <li class="nav-item flex-fill" role="presentation">
                            <button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab"
                                data-bs-target="#santri-justified" type="button" role="tab" aria-controls="home"
                                aria-selected="true">Santri</button>
                        </li>
                        <li class="nav-item flex-fill" role="presentation">
                            <button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab"
                                data-bs-target="#hafalan-justified" type="button" role="tab" aria-controls="profile"
                                aria-selected="false">Hafalan</button>
                        </li>
                    </ul>
                    <div class="tab-content pt-2" id="myTabjustifiedContent">
                        <div class="tab-pane fade show active" id="santri-justified" role="tabpanel"
                            aria-labelledby="home-tab">
                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="nomerinduk" class="col-form-label">Nis <code>*)</code></label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="text" name="nomerinduk" id="nomerinduk"
                                        class="form-control @error('nis') is-invalid @enderror" value="{{ old('nis') }}"
                                        required>
                                    @error('nomerinduk')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="nama" class="col-form-label">Nama</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="text" name="nama" id="nama"
                                        class="form-control @error('nama') is-invalid @enderror" value="" required>
                                    @error('nama')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="kelas" class="col-form-label">Kelas </label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="text" name="kelas_id" id="kelas_id"
                                        class="form-control @error('kelas_id') is-invalid @enderror" value=""
                                        required>
                                    @error('kelas_id')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="tanggal" class="col-form-label">Tanggal </label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="date" name="tanggal" id="tanggal"
                                        class="form-control @error('kelas_id') is-invalid @enderror"
                                        value="@php echo date('Y-m-d'); @endphp" required>
                                    @error('tanggal')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="hafalan-justified" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="tes">Tes ke-</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="number" name="tes" id="tes"
                                        class="form-control @error('tes') is-invalid @enderror" required>
                                    @error('tes')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="surah_id">Surah</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <select class="form-control form-control-lg" required name="surah_id">
                                        <option>---Pilih Surah---</option>
                                        @if (old('surah_id'))
                                            <option>{{ old('surah_id') }}</option>
                                        @endif
                                        @foreach ($surah as $t)
                                            <option>{{ $t->nama }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="ayat">Jumlah Ayat</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="text" name="ayat" id="ayat"
                                        class="form-control @error('ayat') is-invalid @enderror" required>
                                    @error('ayat')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="nilai_hs">Nilai Hafalan Santri</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="number" name="nilai_hs" id="nilai_hs"
                                        class="form-control @error('nilai_hs') is-invalid @enderror" required>
                                    @error('nilai_hs')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="makhroj">Makhroj</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="text" name="makhroj" id="makhroj"
                                        class="form-control @error('makhroj') is-invalid @enderror" required>
                                    @error('makhroj')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="tajwid">Tajwid</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="text" name="tajwid" id="tajwid"
                                        class="form-control @error('tajwid') is-invalid @enderror" required>
                                    @error('tajwid')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="nilai_kb">Nilai Kemampuan Bacaan</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="number" name="nilai_kb" id="nilai_kb"
                                        class="form-control @error('nilai_kb') is-invalid @enderror" required>
                                    @error('nilai_kb')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3 col-3 mt-0 ml-0">
                                    <label for="nilai_akhir">Total Nilai</label>
                                </div>
                                <div class="form-group col-md-7 col-7 mt-0 ml-0">
                                    <input type="number" name="nilai_akhir" id="nilai_akhir"
                                        class="form-control @error('nilai_akhir') is-invalid @enderror" required>
                                    @error('nilai_akhir')
                                        <div class="invalid-feedback"> {{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-4 col-4 mt-0 ml-0 text-right">
                                    <button class="btn btn-primary">Simpan</button>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Default Tabs -->

                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                var inputNIS = document.getElementById("nomerinduk");
                var inputNama = document.getElementById("nama");
                var inputKelas = document.getElementById("kelas_id");

                inputNIS.addEventListener("change", function() {
                    var nisValue = inputNIS.value;

                    // Misalnya, dengan mengirimkan permintaan AJAX ke server

                    // Contoh pengisian nilai input lainnya secara otomatis
                    inputNama.value = "Nama berdasarkan NIS " + nisValue;
                    inputKelas.value = "Kelas berdasarkan NIS " + nisValue;
                });
            });
        </script>

    </section>
    <!-- Masukkan jQuery terlebih dahulu -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Kemudian masukkan file JavaScript Bootstrap -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
@endsection
