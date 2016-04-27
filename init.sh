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
	msg gr Hostname
	echo -n "Please Enter Hostname:"
	read -e OPTION
	[ -f "/etc/sysconfig/network" ] && `sed -i 's/HOSTNAME=*/HOSTNAME='"$OPTION"'/g' /etc/sysconfig/network`
	["`grep -w 'HOSTNAME' /etc/sysconfig/network`" == "$OPTION" ] && msg || hostname
}

function localtime() {
	msg gr "Time Zone"
	
}

function ipaddr() {
	msg gr "Ip Address"

}

function dns() {
	msg gr "DNS server"

}

function yum_repo() {
	msg gr "Yum Repo"

}

function profile() {
	msg gr "Profile"

}

function unlimit() {
	msg gr "Ulimit"

}

function sysctl() {
	msg gr "sysctl.conf"

}

function getty() {
	msg gr "Getty"
	echo -e "\033[32m >>> Configuring: Gettys ... \033[0m"
	sed -e 's/\(^[2-6].*getty.*\)/#\1/' -i /etc/inittab
}

function inittab() {
	msg gr "Control+alt+Delete"

}

function selinux() {
	msg gr "Selinux"

}

function iptables() {
	msg gr "Iptables"

}

function ssh() {
	msg gr "Openssh-server"

}

function service() {
	msg gr "Service"

}

function ipv6() {
	msg gr "Disable Ipv6"

}

function locales() {
	msg gr "Locales"

}

function dpkg() {
	msg gr "Bases Dpkg"

}

function rsyslog() {
	msg gr "Rsyslog"

}

function logrotate() {
	msg gr "Logrotate"

}


