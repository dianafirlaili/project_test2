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
                <div class="breadcrumb-item"><a href="{{ route('hafalan') }}">@yield('title')</a></div>
                <div class="breadcrumb-item">Tambah</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <h5>Tambah Data Hafalan</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('mapel.store') }}" method="post">
                        @csrf

                        <div class="row">
                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nis">Nis <code>*)</code></label>
                                <input type="text" name="nis" id="nis"
                                    class="form-control @error('nis') is-invalid @enderror" value="{{ old('nis') }}"
                                    required>
                                @error('nis')
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
                                <input type="number" name="hafalan_ke" id="hafalan_ke"
                                    class="form-control @error('hafalan_ke') is-invalid @enderror" required>
                                @error('hafalan_ke')
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
                                    @foreach ($surah as $t)
                                        <option>{{ $t->nama }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="card-footer text-right mr-5">
                            <button class="btn btn-primary">Simpan</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>
    </section>
@endsection
