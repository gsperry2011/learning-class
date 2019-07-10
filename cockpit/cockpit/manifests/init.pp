class cockpit {

  package { 'cockpit':
    ensure => latest,
  }

  $content =  "# This file is managed by puppet
[WebService]
LoginTitle=Configured by Puppet
MaxStartups=5
AllowUnencrypted=false
"

  file { '/etc/cockpit/cockpit.conf':
    content => $content,
    mode => "0644",
    owner => "root",
    group => "root",
  }

  service { 'cockpit':
    ensure => running,
    enable => true,
  }
}
