#!/bin/bash
#
#
# Set Linux PATH Environment Variables 
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


function set_hostname() {

}

function set_localtime() {

}

function set_ipaddr() {

}

function set_dns() {

}

function set_yum() {

}

function set_profile() {

}

function set_unlimit() {

}

function set_sysctl() {

}

function set_getty() {
	echo -e "\033[32m >>> Configuring: Gettys ... \033[0m"
    # Remove Unneeded Getty Instances
    sed -e 's/\(^[2-6].*getty.*\)/#\1/' -i /etc/inittab
}

function set_inittab() {

}

function set_selinux() {

}

function set_iptables() {

}

function set_ssh() {

}

function set_service() {

}

function set_ipv6() {

}

function set_locales() {

}

function set_dpkg() {

}

function set_rsyslog() {

}

function set_logrotate() {

}


