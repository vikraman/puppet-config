node 'vikraman.org' {
  include portage
  portage::makeconf {
    'chost':
      content => 'i686-pc-linux-gnu';
    'cflags':
      content => '-Os -march=native -pipe';
    'cxxflags':
      content => '${CFLAGS}';
    'features':
      content => '-collision-protect -ebuild-locks fail-clean parallel-install -protect-owned';
    'makeopts':
      content => '-j2';
    'use':
      content => 'bindist lzma minimal vhosts vim vim-syntax';
    'python_targets':
      content => 'python3_2';
    'ruby_targets':
      content => 'ruby19';
    'emerge_default_opts':
      content => '--keep-going --jobs=2';
    'portdir':
      content => '/usr/portage';
  }
  eselect {
    'profile':
      set => 'hardened/linux/x86/selinux';
    'locale':
      set => 'en_US.utf8';
    'editor':
      set => '/usr/bin/vi';
    'pager':
      set => '/usr/bin/less';
    'visual':
      set => '/usr/bin/vi';
    'vi':
      set => 'vim';
  }
  package_use {
    'app-editors/vim':
      use => '-minimal';
    'sys-libs/ncurses':
      use => '-minimal';
    'sys-apps/net-tools':
      use => 'old-output';
    'dev-libs/libpcre':
      use => 'static-libs';
    'sys-libs/libselinux':
      use => ['ruby', 'static-libs'];
  }
  portage::package {
    'app-admin/puppet':
      ensure   => 'latest',
      use      => ['augeas','diff','-minimal'];
  }
}
