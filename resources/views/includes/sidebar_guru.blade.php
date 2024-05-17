<li {{ $pages == 'dashboard' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('dashboard') }}"><i
            class="fas fa-home"></i> <span>Beranda</span></a></li>

<li {{ $pages == 'santri' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('guru.santri') }}"><i
            class="fas fa-user-graduate"></i><span>Santri</span></a></li>

<li {{ $pages == 'kelas' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('guru.kelas') }}"><i
            class="fas fa-school"></i> <span>Kelas</span></a></li>

<li {{ $pages == 'hafalan' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('guru.hafalan') }}"><i
            class="fas fa-chart-bar"></i> <span>Hafalan Santri</span></a></li>

<li {{ $pages == 'laporan' ? 'class=active' : '' }}><a class="nav-link" href="{{ route('guru.penilaian') }}"><i
            class="fab fa-readme"></i> <span>Laporan</span></a></li>
