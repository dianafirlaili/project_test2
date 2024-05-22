<div class="nav-collapse">
    <a class="sidebar-gone-show nav-collapse-toggle nav-link" href="#">
        <i class="fas fa-ellipsis-v"></i>
    </a>
    <ul class="navbar-nav">


        @if (Auth::user()->tipeuser == 'admin')
        @elseif(Auth::user()->tipeuser == 'guru')

        @elseif(Auth::user()->tipeuser == 'siswa')
        @else
        @endif


    </ul>
</div>
