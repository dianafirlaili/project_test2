@extends('layouts.default')

@section('title')
    Kamar
@endsection

@push('before-script')
    @if (session('status'))
        <x-sweetalertsession tipe="{{ session('kapasitas') }}" status="{{ session('status') }}" />
    @endif
@endpush


@section('content')
    <section class="section">
        <div class="section-header">
            <h1>@yield('title')</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{ route('dashboard') }}">Beranda</a></div>
                <div class="breadcrumb-item"><a href="{{ route('kamar') }}">@yield('title')</a></div>
                <div class="breadcrumb-item">Tambah</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <h5>Tambah Data Kamar</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('kamar.store') }}" method="post">
                        @csrf

                        <div class="row">

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nama">Kamar <code>*)</code></label>
                                <input type="text" name="nama" id="nama"
                                    class="form-control @error('nama') is-invalid @enderror" value="{{ old('nama') }}"
                                    required>
                                @error('nama')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label>Kategori</label>
                                <select class="form-control form-control-lg" required name="kategori">
                                    <option value>---Pilih Kategori---</option>
                                    <option value="1">KS-Putra</option>
                                    <option value="2">KS-Putri</option>
                                </select>
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label>Status</label>
                                <select class="form-control form-control-lg" required name="status">
                                    <option value>---Pilih Status---</option>
                                    <option value="1">Penuh</option>
                                    <option value="2">Tersisa</option>
                                    <option value="3">Belum Terisi</option>
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
