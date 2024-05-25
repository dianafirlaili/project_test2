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
                <div class="breadcrumb-item">Ubah</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <h5>Ubah Data Surah</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('hafalan.update', $id->id) }}" method="post">
                        @method('put')
                        @csrf

                        <div class="row">
                            @php
                                $combined = $k1->merge($kelas)->unique('id');
                            @endphp
                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="kelas_id">Kelas <code></code></label>
                                <select class="form-control @error('kelas_id') is-invalid @enderror" name="kelas_id"
                                    required>
                                    @foreach ($combined as $k)
                                        <option value="{{ $k->id }}">{{ $k->tingkatan }}</option>
                                    @endforeach
                                </select>
                                @error('kelas_id')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="surah">Masukkan Surah (pisahkan dengan tanda koma)</label>
                                <input type="text" name="surah" id="surah"
                                    class="form-control @error('surah') is-invalid @enderror"
                                    value="{{ old('alamat') ? old('alamat') : $id->surah }}" required>
                                @error('surah')
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
