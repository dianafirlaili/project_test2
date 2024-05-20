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
                                <label for="nama">Nama <code>*)</code></label>
                                <input type="text" name="nama" id="nama"
                                    class="form-control @error('nama') is-invalid @enderror" value="{{ old('nama') }}"
                                    required>
                                @error('nama')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-3 col-3 mt-0 ml-5">
                                <label class="form-label">Pilih Kelas</label>
                                <div class="selectgroup w-100">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="tingkatan" value="7" class="selectgroup-input">
                                        <span class="selectgroup-button">7</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="tingkatan" value="8" class="selectgroup-input">
                                        <span class="selectgroup-button">8</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="tingkatan" value="9" class="selectgroup-input">
                                        <span class="selectgroup-button">9</span>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nama">Hafalan ke-</label>
                                <input type="number" max="2" name="hafalan_ke" id="hafalan_ke"
                                    class="form-control @error('hafalan_ke') is-invalid @enderror"
                                    value="{{ old('hafalan_ke') }}" required>
                                @error('hafalan_ke')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label>Surah</label>
                                <select class="form-control form-control-lg" required name="tipe">
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

                        <div class="form-group col-md-5 col-5 mt-0 ml-5">
                            <label for="nama">Catatan</label>
                            <textarea id="catatan" name="catatan" rows="4" cols="50"></textarea>
                            @error('hafalan_ke')
                                <div class="invalid-feedback"> {{ $message }}</div>
                            @enderror
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
