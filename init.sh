#!/bin/bash
#
#
# Set Linux PATH Environment Variables 
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

function msg() {
	[ "$#" = "2" ] && [ "$1" = "gr" -a -n "$2" ] && echo -e "\033[32m >>> Configuring: "$2" \033[0m" || echo -e "\033[33m >>> Configure Done \033[0m"
}


function bases_dpkg _install(){
	rpm -qa|grep -iE "ethtool|wget"|awk '{print "yum install -y " $2 }'|bash
}

function hostname() {
	msg gr "Hostname"
	echo -n "Please Enter Hostname:"
	read -e OPTION
	[ -f "/etc/sysconfig/network" ] && `sed -i 's/HOSTNAME=*/HOSTNAME='"$OPTION"'/g' /etc/sysconfig/network`
	["`grep -w 'HOSTNAME' /etc/sysconfig/network`" == "$OPTION" ] && msg || hostname
}

function localtime() {
	msg gr "Time Zone"
	
}

function ipaddr() {
	ethcount=0
	msg gr "Ip Address and  Netmask and Gateway"
	IP="^(2[0-4][0-9]|25[0-5]|1[0-9][0-9]|[1-9]?[0-9])(\.(2[0-4][0-9]|25[0-5]|1[0-9][0-9]|[1-9]?[0-9])){3}$"
	f0=1;f1=1;f2=1
	ethcount=`lspci |grep -i "eth"|wc -l`
	for ethname in `seq "$ethcount"`
		do
			((ethname-=1))	
			if [ "`ethtool eth"$ethname" |grep -w "Link detected:"|awk '{print $3}'`" = "yes" ] then
				while [ "$f0" = 1 -o "$f1" = 1 -o "$f2" = 1 ] 
					do
						[ "$f0" = 0 ] || read -p "Enter Ipaddr:" ipaddr
						[[ "$ipaddr" =~ $IP ]] && f0=0 || f0=1
						[ "$f1" = 0 ] ||read -p "Enter Netmask:" netmask
						[[ "$netmask" =~ $IP ]] && f1=0 || f1=1
						[ "$f2" = 0 ] || read -p "Enter Gateway:" gateway
						[[ "$gateway" =~ $IP ]] && f2=0 || f2=1
					done
				hwaddr=`ifconfig eth"$ethname"|grep -iw hwaddr|awk '{print $5}'`
				mv /etc/sysconfig/network-scripts/ifcfg-eth$ethname{,.BACKUP}
				echo "DEVICE=eth$ethname
					HWADDR=$hwaddr
					TYPE=Ethernet
					ONBOOT=yes
					NM_CONTROLLED=yes
					BOOTPROTO=static
					IPADDR=$ipaddr
					NETMASK=$netmask
					GATEWAY=$gateway "> /etc/sysconfig/network-scripts/ifcfg-$1
			fi
		done
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
	ulimit -SHn 65535
	[ -f "/etc/rc.local" ] && echo "ulimit -SHn 65535" >> /etc/rc.local || echo "Not Exit /etc/rc.local"
	[ -f "/etc/security/limits.conf" ] && `cat >> /etc/security/limits.conf <<EOF
		* soft nofile 65535
		* hard nofile 65535
		* soft nproc 65535 
		* hard nproc 65535 
		EOF`
	msg
}

function sysctl() {
	msg gr "sysctl.conf"
	[ -f "/etc/sysctl.conf" ] && `cat >> /etc/sysctl.conf << EOF
		net.ipv4.ip_forward = 0
		net.ipv4.conf.default.rp_filter = 1
		net.ipv4.conf.default.accept_source_route = 0
		kernel.sysrq = 0
		kernel.core_uses_pid = 1
		net.ipv4.tcp_syncookies = 1
		kernel.msgmnb = 65535
		kernel.msgmax = 65535
		kernel.shmmax = 68719476736
		kernel.shmall = 4294967296
		net.ipv4.tcp_max_tw_buckets = 6000
		net.ipv4.tcp_sack = 1
		net.ipv4.tcp_window_scaling = 1
		net.ipv4.tcp_rmem = 4096 87380 4194304
		net.ipv4.tcp_wmem = 4096 16384 4194304
		net.core.wmem_default = 8388608 
		net.core.rmem_default = 8388608
		net.core.rmem_max = 16777216
		net.core.wmem_max = 16777216
		net.core.netdev_max_backlog = 262144
		net.core.somaxconn = 262144 
		net.ipv4.tcp_max_orphans = 3276800
		net.ipv4.tcp_max_syn_backlog = 262144 
		net.ipv4.tcp_timestamps = 0
		net.ipv4.tcp_synack_retries = 1 
		net.ipv4.tcp_syn_retries = 1
		net.ipv4.tcp_tw_recycle = 1
		net.ipv4.tcp_tw_reuse = 1
		net.ipv4.tcp_mem = 94500000 915000000 927000000 
		net.ipv4.tcp_fin_timeout = 30 
		net.ipv4.tcp_keepalive_time = 30
		net.ipv4.ip_local_port_range = 1024 65535
		fs.file-max=65535
		# Disable IPv6
		net.ipv6.conf.all.disable_ipv6 = 1
		net.ipv6.conf.default.disable_ipv6 = 1
		net.ipv6.conf.lo.disable_ipv6 = 1
		vm.swappiness= 10
		vm.min_free_kbytes = 524288
		EOF`
		sysctl -p
		msg
}

function getty() {
	msg gr "Getty"
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


