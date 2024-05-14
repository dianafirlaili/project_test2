<li {{ $pages == 'dashboard' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('dashboard') }}"><i
            class="fas fa-home"></i> <span>Beranda</span></a></li>
<li
    class="nav-item dropdown {{ $pages == 'users' || $pages == 'tapel' || $pages == 'siswa' || $pages == 'guru' || $pages == 'kelas' || $pages == 'guru' || $pages == 'mapel' ? 'active' : '' }}">
    <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-dumpster"></i>
        <span>Mastering</span></a>
    <ul class="dropdown-menu">

        <li {{ $pages == 'users' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('users') }}"><i
                    class="fas fa-user"></i> <span>User</span></a></li>
        <li {{ $pages == 'tapel' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('tapel') }}"><i
                    class="fas fa-book"></i> <span>Tahun Pelajaran</span></a></li>
        <li {{ $pages == 'kelas' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('kelas') }}"><i
                    class="fas fa-school"></i><span>Kelas</span></a></li>
        <li {{ $pages == 'santri' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('santri') }}"><i
                    class="fas fa-user-graduate"></i><span>Santri</span></a></li>
        <li {{ $pages == 'guru' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('guru') }}"><i
                    class="fas fa-chalkboard-teacher"></i><span>Guru</span></a></li>
        <li {{ $pages == 'kamar' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('kamar') }}"><i
                    class="fas fa-bed"></i><span>Kamar</span></a></li>
    </ul>
</li>

{{-- <li class="nav-item dropdown {{ $pages == 'mapel' || $pages == 'silabus' || $pages == 'penilaian' ? 'active' : '' }}">
    <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-columns"></i>
        <span>Pembelajaran</span></a>
    <ul class="dropdown-menu">

        <li {{ $pages == 'mapel' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('mapel') }}"><i
                    class="fab fa-monero"></i> <span>Mata Pelajaran</span></a></li>
        <li {{ $pages == 'silabus' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('silabus') }}"><i
                    class="fas fa-microchip"></i> <span>KD - Mapel</span></a></li>
        <li {{ $pages == 'penilaian' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('penilaian') }}"><i
                    class="far fa-star"></i><span>Penilaian</span></a></li>
        <li {{ $pages == 'penilaian' ? 'class=active' : '' }}><a class="nav-link" href="#"><i
                    class="far fa-calendar-check"></i> <span>Eskul</span></a></li>
    </ul>
</li> --}}

<li {{ $pages == 'hafalan' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('dashboard') }}"><i
            class="fas fa-chart-bar"></i> <span>Hafalan Santri</span></a></li>

<li {{ $pages == 'laporan' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('dashboard') }}"><i
            class="fab fa-readme"></i> <span>Laporan</span></a></li>
