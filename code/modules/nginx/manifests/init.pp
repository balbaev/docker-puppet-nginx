class nginx {
        exec { 'apt-update':                    
          command => '/usr/bin/apt-get update'  
        }

        package { 'nginx':
          require => Exec['apt-update'],        
          ensure => installed,
        }

        package { 'nginx-extras':
          require => Exec['apt-update'],        
          ensure => installed,
        }

	$subject = "world"

	file { '/etc/nginx/sites-available/default':
	  require => Package['nginx'],
	  notify => Service['nginx'],
	  path => '/etc/nginx/sites-available/default',
	  ensure => present,
	  content => template("nginx/nginx_default_vhost.erb"),
	}

        service { 'nginx':
          ensure => running,
        }
}
