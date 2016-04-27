#!/bin/bash
#
#
# Set Linux PATH Environment Variables 
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

function msg() {
	[ "$#" = "2" ] && [ "$1" = "gr" -a -n "$2" ] && echo -e "\033[32m >>> Configuring: "$2" \033[0m" || echo -e "\033[33m >>> Configure Done \033[0m"
}


function wget_install(){
	[ "`dpkg -l|grep wget|awk '{print $2}'`" != "wget" ] && `yum install -y wget`
}

function hostname() {
	echo -n "Please Enter Hostname:"
	read -e OPTION
	[ -f "/etc/sysconfig/network" ] && `sed -i 's/HOSTNAME=*/HOSTNAME='"$OPTION"'/g' /etc/sysconfig/network`
}

function localtime() {

}

function ipaddr() {

}

function dns() {

}

function yum_repo() {

}

function profile() {

}

function unlimit() {

}

function sysctl() {

}

function getty() {
	echo -e "\033[32m >>> Configuring: Gettys ... \033[0m"
    # Remove Unneeded Getty Instances
    sed -e 's/\(^[2-6].*getty.*\)/#\1/' -i /etc/inittab
}

function inittab() {

}

function selinux() {

}

function iptables() {

}

function ssh() {

}

function service() {

}

function ipv6() {

}

function locales() {

}

function dpkg() {

}

function rsyslog() {

}

function logrotate() {

}


