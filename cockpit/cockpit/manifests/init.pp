class cockpit {

  package { 'cockpit':
    ensure => latest,
  }

  file { '/etc/cockpit/cockpit.conf':
    source => '/root/cockpit/cockpit/files/cockpit.conf',
    mode => "0644",
    owner => "root",
    group => "root",
  }

  service { 'cockpit':
    ensure => running,
    enable => true,
  }
}
