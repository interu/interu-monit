class monit {
    $gmail_account=$monit::params::gmail_account
    $gmail_password=$monit::params::gmail_password

    $mail_from=$monit::params::mail_from
    $mail_to=$monit::params::mail_to

    $configdir = "/etc/monit.d"

    case $operatingsystem {
        'Ubuntu': { $config = "/etc/monitrc" }
        'CentOS': { $config = "/etc/monit.conf" }
        'Fedora': { $config = "/etc/monit.conf" }
        default: { fail("\$operatingsystem of ${fqdn} is not recognized ( '${operatingsystem}' ). ") }
    }

    package {
        "monit": ensure => installed;
    }

    service { monit:
        ensure => 'running',
        check => ['ensure', 'enable'],
        require => [Package["monit"], File["$config"]];
    }

    file {
        $configdir:
            ensure => directory;
        $config:
            ensure => present,
            content => template("monit.conf.erb"),
            group => root,
            require => File["$configdir"],
            notify => Service[monit],
            mode => 0700;
    }
}

