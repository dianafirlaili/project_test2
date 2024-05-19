@extends('layouts.default')

@section('title')
    Santri
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
                <div class="breadcrumb-item"><a href="{{ route('santri') }}">@yield('title')</a></div>
                <div class="breadcrumb-item">Tambah</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <h5>Tambah Data Santri</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('santri.store') }}" method="post" enctype="multipart/form-data">
                        @csrf

                        <div class="row">

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nomerinduk">Nomer Induk <code>*)</code></label>
                                <input type="text" name="nomerinduk" id="nomerinduk"
                                    class="form-control @error('nomerinduk') is-invalid @enderror"
                                    value="{{ old('nomerinduk') }}" required>
                                @error('nomerinduk')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nama">Nama Lengkap<code>*)</code></label>
                                <input type="text" name="nama" id="nama"
                                    class="form-control @error('nama') is-invalid @enderror" value="{{ old('nama') }}"
                                    required>
                                @error('nama')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>


                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="tempatlahir">Tempat Lahir<code>*)</code></label>
                                <input type="text" name="tempatlahir" id="tempatlahir"
                                    class="form-control @error('tempatlahir') is-invalid @enderror"
                                    value="{{ old('tempatlahir') }}" required>
                                @error('tempatlahir')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="tgllahir">Tanggal Lahir<code>*)</code></label>
                                <input type="date" name="tgllahir" id="tgllahir"
                                    class="form-control @error('tgllahir') is-invalid @enderror"
                                    value="{{ old('tgllahir') }}" required>
                                @error('tgllahir')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>


                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="agama">Agama <code></code></label>
                                <input type="text" name="agama" id="agama"
                                    class="form-control @error('tgllahir') is-invalid @enderror" value="Islam" required>
                                @error('agama')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="alamat">Alamat<code>*)</code></label>
                                <input type="text" name="alamat" id="alamat"
                                    class="form-control @error('alamat') is-invalid @enderror" value="{{ old('alamat') }}"
                                    required>
                                @error('alamat')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="jk">Jenis Kelamin <code></code></label>

                                <select class="form-control  @error('jk') is-invalid @enderror" name="jk" required>
                                    <option value>---Pilih Jenis Kelamin---</option>
                                    <option value="1">Laki-laki</option>
                                    <option value="2">Perempuan</option>
                                </select>
                                @error('jk')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>


                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="tapel_id">Tahun Pelajaran <code></code></label>

                                <select class="form-control  @error('tapel_id') is-invalid @enderror" name="tapel_id"
                                    required>
                                    <option value>---Pilih Tahun Pelajaran---</option>
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
                                <label for="kelas_id">Kelas <code></code></label>

                                <select class="form-control  @error('kelas_id') is-invalid @enderror" name="kelas_id"
                                    required>
                                    <option value>---Pilih Kelas---</option>
                                    @forelse ($kelas as $d)
                                        <option value="{{ $d->id }}">{{ $d->tingkatan }}
                                        </option>
                                    @empty
                                        <option value=""> Data belum tersedia</option>
                                    @endforelse
                                </select>
                                @error('kelas_id')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="kelas_id">Kamar <code></code></label>

                                <select class="form-control  @error('kamar_id') is-invalid @enderror" name="kamar_id"
                                    required>
                                    <option value>---Pilih Kamar---</option>
                                    @forelse ($kamar as $d)
                                        <option value="{{ $d->id }}">{{ $d->nama }}
                                        </option>
                                    @empty
                                        <option value=""> Data belum tersedia</option>
                                    @endforelse
                                </select>
                                @error('kelas_id')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="email">Email<code></code></label>

                                <input type="text" class="form-control  @error('email') is-invalid @enderror"
                                    name="email" required value="{{ old('email') }}">

                                @error('email')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="password">Password<code></code></label>


                                <input type="password" class="form-control  @error('password') is-invalid @enderror"
                                    name="password" required>

                                @error('password')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="password2">Konfirmasi Password<code></code></label>


                                <input type="password" class="form-control  @error('password2') is-invalid @enderror"
                                    name="password2" required>

                                @error('password2')
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
