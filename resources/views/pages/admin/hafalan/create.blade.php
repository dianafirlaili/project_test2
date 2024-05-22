@extends('layouts.default')

@section('title')
    Kelola Surah Hafalan
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
                    <h5>Tambah Surah</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('hafalan.store') }}" method="post">
                        @csrf

                        <div class="row">
                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label>Kelas</label>
                                <select class="form-control form-control-lg" required name="kelas_id">
                                    <option>---Pilih Kelas---</option>
                                    @if (old('kelas_id'))
                                        <option>{{ old('kelas_id') }}</option>
                                    @endif
                                    @foreach ($kelas as $t)
                                        <option>{{ $t->tingkatan }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="surah">Masukkan Surah (pisahkan dengan tanda koma)</label>
                                <input type="text" name="surah" id="surah"
                                    class="form-control @error('surah') is-invalid @enderror" required
                                    placeholder="Contoh: Al-Fatihah, Al-Baqarah">
                                @error('surah')
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
