#! /bin/bash
#
# Provisioning script common for all servers

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

export readonly db_root_password='6Qow9FjS6jttmbdp4e981aXMh'
export readonly db_name='wordpress_db'
export readonly db_user='wordpress_user'
export readonly db_password='6Qow9FjS6jttmbdp4e981aXMh'

export readonly STATIC_IP_WEB="192.168.207.50"
export readonly STATIC_IP_DB="192.168.207.52" 
export readonly STATIC_IP_RP="192.168.207.18"
export readonly STATIC_IP_TFTP="192.168.207.51" 

export readonly NETMASK_VLAN11="255.255.255.248"  
export readonly NETMASK_VLAN14="255.255.255.240" 
export readonly NETMASK_VLAN1="255.255.255.128"   

export readonly GATEWAY_VLAN11="192.168.207.49"  
export readonly GATEWAY_VLAN14="192.168.207.17"   
export readonly GATEWAY_VLAN1="192.168.207.129"   
export readonly NETWORK_VLAN1="192.168.207.128"   


export readonly INTERFACE="eth1"
export readonly DOMAIN_NAME="g07-syndus.internal"
export readonly DNS_SERVER="192.168.207.49"

#-----------------------WORDPRES gegevens---------------------------------#

# wordpress configuratie pad
export readonly WP_CONFIG="/var/www/html/wordpress/wp-config.php"
export readonly WP_TITLE="SEP G07"
export readonly WP_ADMIN="gilles"
export readonly WP_PASSWORD="gilles"
export readonly WP_EMAIL="g07-syndus.internal"
#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------
# TODO: put all variable definitions here. Tip: make them readonly if possible.

# Set to 'yes' if debug messages should be printed.
readonly debug_output='yes'

#------------------------------------------------------------------------------
# Helper functions
#------------------------------------------------------------------------------
# Three levels of logging are provided: log (for messages you always want to
# see), debug (for debug output that you only want to see if specified), and
# error (obviously, for error messages).

# Usage: log [ARG]...
#
# Prints all arguments on the standard error stream
log() {
  printf '\e[0;33m[LOG]  %s\e[0m\n' "${*}"
}

# Usage: debug [ARG]...
#
# Prints all arguments on the standard error stream
debug() {
  if [ "${debug_output}" = 'yes' ]; then
    printf '\e[0;36m[DBG] %s\e[0m\n' "${*}"
  fi
}

# Usage: error [ARG]...
#
# Prints all arguments on the standard error stream
error() {
  printf '\e[0;31m[ERR] %s\e[0m\n' "${*}" 1>&2
}

#------------------------------------------------------------------------------
# Provisioning tasks
#------------------------------------------------------------------------------

log '=== Starting common provisioning tasks ==='

# TODO: insert common provisioning code here, e.g. install EPEL repository, add
# users, enable SELinux, etc.

log "Ensuring SELinux is active"

if [ "$(getenforce)" != 'Enforcing' ]; then
    # Enable SELinux now
    setenforce 1

    # Change the config file
    sed -i 's/SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
fi

log "Installing useful packages"

dnf install -y \
    bind-utils \
    cockpit \
    nano \
    tree \
    wget \
    unzip \
    nmap  \
    nc \
    epel-release

log "Enabling essential services"

systemctl enable --now firewalld.service
systemctl enable --now cockpit.socket


# Uitschakelen van root-login via SSH
log "Uitschakelen van root-login via SSH en alleen toestaan van SSH-keyauthenticatie"
sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

# Toestaan van alleen SSH-keyauthenticatie
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

readonly pub_gilles='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDB929XxcogCT3m8ygsy/os/XFW7QbGvzffWBN0sqtL6DxKPPhH9wolj/q9eT6j4s7XpFF1b93zo9LE1XkZEhDOsW4+GKlC/EQqpC1mN0p4H7DhCX4+1iVXxSsigLZB7WlEbc6nGT9O4DG1WFztgzCWQuxMS99cWB3dW+yE/HV13cNUio5bpPqvIwNKRNVHAataSdXVwv1WtWuxQxnPTW/N1ENCXNL1akWuLb5iMzNOxSDfd3pUzY+zIINQYehDUphdeF/rgbDUzbSs2PMQKPvrhW/aZYmmE41VxXAl34mqpWjUAK5IZ2A9V0yN8vtnZE3mwjbm4Cb9IRJrctSWaNmtcFCbI23uvFk4JIZ0TzV0jQy+qynLdqq7HWLHcajbgm7tAr0+C0vh4m8ly3RcTgV857Tro3DTiug4VZIlF7biLvRJ8DGJhSoLk8cty2FLYRninz5Rk9ClOVuDcDgUqyj1ov9CB2kqu8IiiJrDbwYplpVnYSN+vtBy48toZ1Vteec= gille@Laptop-Gilles'
readonly pub_ruben='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCo14BUgtWousIshnnvpgWt3xMywv8eeTnZbHkWfBTey+/2mdDGarozZQdxYSY4MXxrxsIVVPfwBTdpGeuld5V6TYHKWf9s//FVSthOEpq/fHr6qCgNRgySFZp5Ubn31zFzRvWh5HurqZdFvtYxSfFYiAd1mCdkbnzK6WyEPArfkX7iQBQBLXIznA5iOonhPeifUbMaHU9Zy/esSNweQuXhnTQJlefujZQiTYNibyMowsSzcEI99gSotz7giCbQUAacZuPZnLkM1EmYEKrrY5VcWK+h2U+fZS4eWj2ufjp3oSkgRR7oEpL8xTynX9gmcDwXThdTzgboeKWfoMt1QfbxjxfxscY4Ay33J9E5h6NdkptGhGI1L/OGNC13AxKOOD30nF2ObamLe9cXmCtElQFmfQ3iBWGvGqrL6JWcfT3oqfmGOcJawWqDQS3tgSWoBXHmjjhfv6HUrcAE/325br25T2x8vxfFmvJ73002Dor0GzsvsWqiVUpslujY/esXE38= ruben@DESKTOP-TBSBFRI'
readonly pub_matthias='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5z1GaPYvqPUDnot9+DAuz9EnYaE20HaJRHn1sO6Dw9dW+iGfbkcZxOOqLOaG6vZuamn89hQ2P6e8rCGLe6OjP2/fEz4V9FugA/jHZUMEKvqLWK/U/RaoE0HwsFczwzYgQced93v4Om4M8QCi/yPuE+cdFEd10kkwvoffNyPCZp7yyohMn3ufRQBCaq53+lHIbrTfsdCDd447B2iBIhzbiL/7z4POKeTXPVispQKQaRxIvoj7J1pt9H0KKLBeLrk7xKbDztFxQfV6ZpIl+3ENaqy+4GiQB+xOUgxc8d4K6h6LReN6fdZTiFfyICnQpk32jA2LHDhcHbFq3v1MiXb/RrTvHoyu2Hqje/l4JxNMFu6E/XAGxILzg48pwwCdRRKl2VyC68DTCDqjmD46s00o3R7oM8nzPIL2QCT6QLdoyFm+MpxODNM16W2gQTsR8gTxDEhYnGiMtzwgIK0m8C5pQM2cvamu60WJAtHBcic4D/ZY4O/4K30By+lCMzPLR9jk= matth@DESKTOP-D3TU6L3
'
# Add public keys for SSH access if not already added
for key in "$pub_gilles" "$pub_ruben" "$pub_matthias"; do
    if ! grep -q "$(echo "$key" | awk '{print $3}')" /home/vagrant/.ssh/authorized_keys; then
        log "Toevoegen van SSH public key: $(echo "$key" | awk '{print $3}')"
        echo "$key" >> /home/vagrant/.ssh/authorized_keys
    fi
done

# Restart SSH service to apply changes
systemctl restart sshd







