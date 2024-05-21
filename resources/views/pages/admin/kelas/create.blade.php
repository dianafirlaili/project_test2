@extends('layouts.default')

@section('title')
    Kelas
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
                <div class="breadcrumb-item"><a href="{{ route('kelas') }}">@yield('title')</a></div>
                <div class="breadcrumb-item">Tambah</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <h5>Tambah Data Kelas</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('kelas.store') }}" method="post">
                        @csrf

                        <div class="row">


                            <div class="form-group col-md-3 col-3 mt-0 ml-5">
                                <label class="form-label">Pilih Tingkatan</label>
                                <div class="selectgroup w-100">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="tingkatan" value="7" class="selectgroup-input"
                                            checked="">
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
                                <label for="tapel_id">Tahun Pelajaran <code></code></label>
                                <select class="form-control  @error('tapel_id') is-invalid @enderror" name="tapel_id"
                                    required>
                                    <option>---Pilih Tahun Pelajaran</option>
                                    @forelse ($tapel as $d)
                                        <option value="{{ $d->id }}">{{ $d->nama }}</option>
                                    @empty
                                        <option value=""> Data belum tersedia</option>
                                    @endforelse
                                </select>
                                @error('tapel_id')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="guru_id">Walikelas <code></code></label>

                                <select class="form-control  @error('guru_id') is-invalid @enderror" name="guru_id"
                                    required>
                                    <option>---Pilih Walikelas</option>
                                    @forelse ($walikelas as $d)
                                        <option value="{{ $d->id }}">{{ $d->nomerinduk }} - {{ $d->nama }}
                                        </option>
                                    @empty
                                        <option value=""> Data belum tersedia</option>
                                    @endforelse
                                </select>
                                @error('guru_id')
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
    </section>
@endsection
