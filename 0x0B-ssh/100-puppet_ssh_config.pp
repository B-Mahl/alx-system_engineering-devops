# Define the SSH client configuration file path
$ssh_config_file = '/etc/ssh/ssh_config'

# Define the content of the SSH client configuration
$ssh_config_content = @(EOT)
Host *
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
EOT

# Ensure the SSH client configuration file exists and has the desired content
file { $ssh_config_file:
    ensure  => file,
    content => $ssh_config_content,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
}
