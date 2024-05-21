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
                <div class="breadcrumb-item">Ubah</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <h5>Ubah Data Kelas</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('kelas.update', $id->id) }}" method="post">
                        @method('put')
                        @csrf

                        <div class="row">


                            <div class="form-group col-md-3 col-3 mt-0 ml-5">
                                <label class="form-label">Pilih Tingkatan</label>
                                <div class="selectgroup w-100">
                                    <label class="selectgroup-item">
                                        <input type="radio" name="tingkatan" value="7" class="selectgroup-input"
                                            {{ $id->tingkatan == '7' ? 'checked=""' : '' }}>
                                        <span class="selectgroup-button">7</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="tingkatan" value="8" class="selectgroup-input"
                                            {{ $id->tingkatan == '8' ? 'checked=""' : '' }}>
                                        <span class="selectgroup-button">8</span>
                                    </label>
                                    <label class="selectgroup-item">
                                        <input type="radio" name="tingkatan" value="9" class="selectgroup-input"
                                            {{ $id->tingkatan == '9' ? 'checked=""' : '' }}>
                                        <span class="selectgroup-button">9</span>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="tapel_id">Pilih Tahun Pelajaran <code></code></label>
                                <select class="form-control  @error('tapel_id') is-invalid @enderror" name="tapel_id"
                                    required>
                                    @foreach ($tapel as $d)
                                        @if ($d->id != $id->tapel_id)
                                            <option value="{{ $d->id }}">{{ $d->nama }}</option>
                                        @endif
                                    @endforeach
                                    @if ($tapel->isEmpty())
                                        <option value="">Data belum tersedia</option>
                                    @endif
                                </select>
                                @error('tapel_id')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="guru_id">Pilih Walikelas <code></code></label>

                                <select class="form-control  @error('guru_id') is-invalid @enderror" name="guru_id"
                                    required>
                                    @if ($id->guru_id != null and $id->guru_id != '' and $id->guru != null)
                                        <option value="{{ $id->guru_id }}">{{ $id->guru->nama }}</option>
                                    @endif
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
