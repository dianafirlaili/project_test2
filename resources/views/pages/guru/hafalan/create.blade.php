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
                <div class="card-header">
                    <h5>Tambah Hafalan Santri</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('guru.hafalan.store') }}" method="post">
                        @csrf

                        <div class="row">
                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nomerinduk">Nis <code>*)</code></label>
                                <input type="text" name="nomerinduk" id="nomerinduk"
                                    class="form-control @error('nis') is-invalid @enderror" value="{{ old('nis') }}"
                                    required>
                                @error('nomerinduk')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nama">Nama</label>
                                <input type="text" name="nama" id="nama"
                                    class="form-control @error('nama') is-invalid @enderror" value="" required>
                                @error('nama')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="kelas">Kelas </label>
                                <input type="text" name="kelas_id" id="kelas_id"
                                    class="form-control @error('kelas_id') is-invalid @enderror" value="" required>
                                @error('kelas_id')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="tanggal">Tanggal </label>
                                <input type="date" name="tanggal" id="tanggal"
                                    class="form-control @error('kelas_id') is-invalid @enderror"
                                    value="@php echo date('Y-m-d'); @endphp" required>
                                @error('tanggal')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="tes">Tes ke-</label>
                                <input type="number" name="tes" id="tes"
                                    class="form-control @error('tes') is-invalid @enderror" required>
                                @error('tes')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label>Surah</label>
                                <select class="form-control form-control-lg" required name="surah_id">
                                    <option>---Pilih Surah---</option>
                                    @if (old('surah_id'))
                                        <option>{{ old('surah_id') }}</option>
                                    @endif
                                    @foreach ($surah as $data)
                                        @php
                                            $surahParts = explode(',', $data->surah);
                                        @endphp
                                        {{-- Membuat opsi select untuk setiap bagian surah --}}
                                        @foreach ($surahParts as $part)
                                            <option value="{{ $part }}">{{ $part }}</option>
                                        @endforeach
                                    @endforeach
                                </select>

                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="ayat">Jumlah Ayat</label>
                                <input type="text" name="ayat" id="ayat"
                                    class="form-control @error('ayat') is-invalid @enderror" required>
                                @error('ayat')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nilai_hs">Nilai Hafalan Santri</label>
                                <input type="number" name="nilai_hs" id="nilai_hs"
                                    class="form-control @error('nilai_hs') is-invalid @enderror" required>
                                @error('nilai_hs')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>
                            <hr>
                            <div class="card-header">
                                <h5>Kemampuan Bacaan</h5>
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="makhroj">Makhroj</label>
                                <input type="text" name="makhroj" id="makhroj"
                                    class="form-control @error('makhroj') is-invalid @enderror" required>
                                @error('makhroj')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="tajwid">Tajwid</label>
                                <input type="text" name="tajwid" id="tajwid"
                                    class="form-control @error('tajwid') is-invalid @enderror" required>
                                @error('tajwid')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nilai_kb">Nilai Kemampuan Bacaan</label>
                                <input type="number" name="nilai_kb" id="nilai_kb"
                                    class="form-control @error('nilai_kb') is-invalid @enderror" required>
                                @error('nilai_kb')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nilai_akhir">Total Nilai</label>
                                <input type="number" name="nilai_akhir" id="nilai_akhir"
                                    class="form-control @error('nilai_akhir') is-invalid @enderror" required>
                                @error('nilai_akhir')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="card-footer text-right mr-5">
                            <button class="btn btn-primary">Simpan</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function() {
                $("#nomerinduk").change(function() {
                    var nisValue = $(this).val();

                    // Kirim permintaan AJAX ke server
                    $.ajax({
                        url: "/santricontroller/" + nisValue,
                        method: "GET",
                        success: function(response) {
                            // Isi nilai input lainnya secara otomatis dengan data yang diterima dari server
                            $("#nama").val(response.nama);
                            $("#kelas_id").val(response.tingkatan);
                        },
                        error: function(xhr, status, error) {
                            console.error(error);
                        }
                    });
                });
            });
        </script>


    </section>
@endsection
