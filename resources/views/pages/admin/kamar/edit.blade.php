@extends('layouts.default')

@section('title')
    Kamar
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
                <div class="breadcrumb-item active"><a href="{{ route('dashboard') }}">Dashboard</a></div>
                <div class="breadcrumb-item"><a href="{{ route('mapel') }}">@yield('title')</a></div>
                <div class="breadcrumb-item">Ubah</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-header">
                    <h5>Ubah Data Kamar</h5>
                </div>
                <div class="card-body">

                    <form action="{{ route('kamar.update', $id->id) }}" method="post">
                        @method('put')
                        @csrf

                        <div class="row">

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label for="nokamar">No Kamar <code>*)</code></label>
                                <input type="text" name="nokamar" id="nokamar"
                                    class="form-control @error('nokamar') is-invalid @enderror"
                                    value="{{ old('nokamar') ? old('nokamar') : $id->nokamar }}" required>
                                @error('nokamar')
                                    <div class="invalid-feedback"> {{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group col-md-5 col-5 mt-0 ml-5">
                                <label>Kapasitas</label>
                                <select class="form-control form-control-lg" required name="kapasitas">
                                    @if (old('kapasitas'))
                                        <option>{{ old('kapasitas') }}</option>
                                    @endif
                                    @for ($i = 2; $i <= 12; $i += 2)
                                        <option>{{ $i }} santri</option>
                                    @endfor
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
