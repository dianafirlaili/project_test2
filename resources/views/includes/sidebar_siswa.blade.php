<li {{ $pages == 'dashboard' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('dashboard') }}"><i
            class="fas fa-home"></i> <span>Beranda</span></a></li>

<li {{ $pages == 'penilaian' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('menusiswa.lihatnilai') }}"><i
            class="far fa-star"></i> <span>Laporan</span></a></li>
