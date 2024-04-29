# Define class for Nginx installation and configuration
class nginx_server {
    # Install Nginx package
    package { 'nginx':
        ensure => installed,
    }

    # Configure Nginx server
    file { '/etc/nginx/sites-available/default':
        ensure  => present,
        content => template('nginx/default.erb'),
        require => Package['nginx'],
        notify  => Service['nginx'],
    }

    # Ensure Nginx service is running
    service { 'nginx':
        ensure  => running,
        enable  => true,
    }
}
