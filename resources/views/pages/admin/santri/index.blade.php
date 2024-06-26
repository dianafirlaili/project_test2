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
                {{-- <div class="breadcrumb-item"><a href="#">Layout</a></div> --}}
                <div class="breadcrumb-item">@yield('title')</div>
            </div>
        </div>

        <div class="section-body">
            <div class="card">
                <div class="card-body">

                    <form action="{{ route('santri.cari') }}" method="GET" class="d-inline">
                        <div class="d-flex bd-highlight mb-0 align-items-center">

                            <div class="p-2 bd-highlight">
                                <input type="text" class="form-control form-control-sm" name="cari"
                                    placeholder="Cari . . ." autocomplete="off"
                                    value="{{ $request->cari != null ? $request->cari : '' }}">
                            </div>

                            <div class="p-2 bd-highlight">
                                <button class="btn btn-info px-4 " type="submit" value="Cari"> <span
                                        class="pcoded-micon"><i class="fas fa-search"></i> Cari </button>


                            </div>
                            <div class="ml-auto p-2 bd-highlight">
                                <x-button-create link="{{ route('santri.create') }}" />

                            </div>

                        </div>
                    </form>

                    <x-jsmultidel link="{{ route('santri.multidel') }}" />

                    @if ($datas->count() > 0)
                        <x-jsdatatable />
                    @endif

                    <table id="example" class="table table-striped table-bordered mt-0 table-sm" style="width:100%">
                        <thead>
                            <tr style="background-color: #F1F1F1">
                                <th class="text-center py-2 babeng-min-row"> <input type="checkbox" id="chkCheckAll"> All
                                </th>
                                <th>Nama</th>
                                <th>Tempat/Tgl Lahir</th>
                                <th>Jenis Kelamin</th>
                                <th>Alamat</th>
                                <th>Kelas</th>
                                <th>Email</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($datas as $data)
                                <tr id="sid{{ $data->id }}">
                                    <td class="text-center">
                                        <input type="checkbox" name="ids" class="checkBoxClass "
                                            value="{{ $data->id }}">
                                        {{ $loop->index + 1 + ($datas->currentPage() - 1) * $datas->perPage() }}
                                    </td>
                                    <td>
                                        {{ $data->nomerinduk . '-' . Str::limit($data->nama, 25, ' ...') }}
                                    </td>
                                    <td>
                                        {{ $data->tempatlahir . '/' . $data->tgllahir }}
                                    </td>
                                    <td>
                                        @php
                                            if ($data->jk == 1) {
                                                echo 'Laki-laki';
                                            } else {
                                                echo 'Perempuan';
                                            }
                                        @endphp

                                    </td>
                                    <td>
                                        {{ $data->alamat }}
                                    </td>
                                    <td>
                                        {{ $data->kelas->tingkatan }}
                                    </td>
                                    <td>
                                        {{ $data->users != null ? $data->users->email : 'Data tidak ditemukan' }}
                                    </td>

                                    <td class="text-center babeng-min-row">
                                        {{-- <x-button-reset-pass link="/admin/{{ $pages }}/{{$data->id}}/reset" /> --}}
                                        <x-button-edit link="/admin/{{ $pages }}/{{ $data->id }}" />
                                        <x-button-delete link="/admin/{{ $pages }}/{{ $data->id }}" />
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="text-center">Data tidak ditemukan</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-between flex-row-reverse mt-3">
                        <div>
                            @php
                                $cari = $request->cari;
                            @endphp
                            {{ $datas->onEachSide(1)->links() }}

                        </div>
                        <div>
                            <a href="#" class="btn btn-sm  btn-danger mb-2" id="deleteAllSelectedRecord"
                                onclick="return  confirm('Anda yakin menghapus data ini? Y/N')" data-toggle="tooltip"
                                data-placement="top" title="Hapus Terpilih">
                                <i class="fas fa-trash-alt mr-2"></i> Hapus Terpilih</i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
