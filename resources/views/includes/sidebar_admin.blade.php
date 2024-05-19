<li {{ $pages == 'dashboard' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('dashboard') }}"><i
            class="fas fa-home"></i> <span>Beranda</span></a></li>
<li
    class="nav-item dropdown {{ $pages == 'users' || $pages == 'tapel' || $pages == 'santri' || $pages == 'guru' || $pages == 'kelas' || $pages == 'kamar' || $pages == 'mapel' ? 'active' : '' }}">
    <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-dumpster"></i>
        <span>Mastering</span></a>
    <ul class="dropdown-menu">

        <li {{ $pages == 'users' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('users') }}"><i
                    class="fas fa-user"></i> <span>User</span></a></li>
        <li {{ $pages == 'guru' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('guru') }}"><i
                    class="fas fa-chalkboard-teacher"></i><span>Guru</span></a></li>
        <li {{ $pages == 'santri' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('santri') }}"><i
                    class="fas fa-user-graduate"></i><span>Santri</span></a></li>
        <li {{ $pages == 'kelas' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('kelas') }}"><i
                    class="fas fa-school"></i><span>Kelas</span></a></li>
        <li {{ $pages == 'kamar' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('kamar') }}"><i
                    class="fas fa-bed"></i><span>Kamar</span></a></li>
    </ul>
</li>

<li {{ $pages == 'hafalan' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('hafalan') }}"><i
            class="fas fa-chart-bar"></i> <span>Hafalan Santri</span></a></li>

<li {{ $pages == 'laporan' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('penilaian') }}"><i
            class="fab fa-readme"></i> <span>Laporan</span></a></li>
