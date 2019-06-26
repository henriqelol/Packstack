#Install Openstack | Centos 7
#Initial System Configurations
sudo su
ss -tulpn
systemctl stop postfix firewalld NetworkManager
systemctl disable postfix firewalld NetworkManager
systemctl mask NetworkManager
yum remove –y postfix NetworkManager NetworkManager-libnm
systemctl start network
systemctl enable network
systemctl status firewalld NetworkManager network
setenforce 0
getenforce
sed -i 's/=enable/=disabled/' /etc/selinux/config
hostnamectl set-hostname controller
yum install -y ntpdate

#Install OpenStack in CentOS
yum install -y centos-release-openstack-rocky
yum update -y
yum install -y openstack-packstack
yum install -y bash-completion vim epel-release

yum install -y wget



#SELINUX=disable

packstack --gen-answer-file='ntp'.con
lsf


vi 13.04.16.conf

CONFIG_NTP_SERVERS=0.ro.pool.ntp.org
CONFIG_PROVISION_DEMO=n
CONFIG_KEYSTONE_ADMIN_PW=your_password
CONFIG_HORIZON_SSL=y
CONFIG_MARIADB_PW=mypassword1234
CONFIG_NAGIOS_PW=nagios1234

vi /etc/ssh/sshd_config
#PermitRootLogin yes
systemctl restart sshd
systemctl status sshd

packstack --answer-file ntp.conf

vim /etc/httpd/conf.d/ssl.conf
#Listen 443 https

systemctl restart httpd.service

packstack --answer-file /root/ntp.conf
https://192.168.1.40/dashboard 