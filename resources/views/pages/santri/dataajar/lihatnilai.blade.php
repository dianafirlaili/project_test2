@extends('layouts.default')

@section('title')
    {{-- Kompetensi Dasar {{$data->mapel->nama}}  - {{$data->kelas->tingkatan}} {{$data->kelas->jurusan}} {{$data->kelas->suffix}} --}}
@endsection

@push('before-script')
    @if (session('status'))
        <x-sweetalertsession tipe="{{ session('tipe') }}" status="{{ session('status') }}" />
    @endif
@endpush


@section('content')
    <section class="section">

        <div class="section-body">
            <div class="card">
                <div class="card-body">

                    <div id="babeng-bar" class="text-center mt-2">

                        <div id="babeng-row ">

                            <form action="{{ route('penilaian.cari') }}" method="GET">


                                <div class="d-flex bd-highlight mb-3 align-items-center">

                                    <div class="p-2 bd-highlight">
                                        <input type="text" class="babeng babeng-select  ml-0" name="cari">
                                    </div>
                                    <div class="p-2 bd-highlight">
                                        <span>
                                            <input class="btn btn-info ml-1 mt-2 mt-sm-0" type="submit" id="babeng-submit"
                                                value="Cari">
                                        </span>
                                    </div>
                            </form>

                        </div>
                    </div>

                    {{-- <x-jsmultidel link="{{route('dataajar.kompetensidasar.multidel',$data->id)}}" />

                @if ($datas->count() > 0)
                    <x-jsdatatable/>
                @endif --}}

                    <table id="example" class="table table-striped table-bordered mt-1 table-sm" style="width:100%">
                        <thead>
                            <tr style="background-color: #F1F1F1">
                                <th class="text-center py-2 ">
                                    No</th>
                                {{-- <th  class="text-center py-2 babeng-min-row">Siswa</th> --}}

                                <th class="text-center py-2 ">Mata Pelajaran</th>
                                {{-- <th   class="text-center py-2 babeng-min-row">Materi</th> --}}
                                <th class="text-center py-2">Guru Pengampu</th>
                                <th class="text-center ">Tuntas/Belum</th>
                                <th class="text-center">Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($dataakhir as $data)
                                <tr id="sid">
                                    <td class="text-center babeng-min-row">
                                        {{ $loop->index + 1 }}</td>

                                    {{-- <td class="text-center">

                                    {!! $data->siswa->nama!=null ? $data->siswa->nama : 'Data tidak ditemukan' !!}
                                </td> --}}
                                    <td class="text-center">
                                        {{ $data->mapel != null ? $data->mapel : 'Data tidak ditemukan' }}
                                    </td>
                                    <td class="text-center">
                                        {{ $data->guru_nama != null ? $data->guru_nama : 'Data tidak ditemukan' }}
                                    </td>

                                    {{-- <td class="text-center">
                                    {{$data->kelas_nama!=null ? $data->kelas_nama : 'Data tidak ditemukan'}}
                                </td> --}}

                                    <td class="text-center">
                                        @php
                                            $warna = 'warning';
                                            $tuntas = 'Belum tuntas';
                                            if ($data->avg != null and $data->avg >= 75) {
                                                $warna = 'success';
                                                $tuntas = 'Tuntas';
                                            }
                                        @endphp
                                        {{-- {{$data->avg!=null ? $data->avg : $hasil}} --}}
                                        <button class="btn btn-sm btn-{{ $warna }}">{{ $tuntas }}</button>
                                    </td>

                                    <td class="text-center babeng-min-row">
                                        <a class="btn btn-sm btn-info"
                                            href="{{ route('menusiswa.detailpenilaian', $data->id) }}">Detail</a>
                                    </td>



                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="text-center">Data tidak ditemukan</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </section>
@endsection
