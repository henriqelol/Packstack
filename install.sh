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
#yum install -y bash-completion vim epel-release
#yum install -y wget
packstack --gen-answer-file='CONFIGURACAO'.conf
sed -i 's/CONFIG_NTP_SERVERS=/CONFIG_NTP_SERVERS=0.ro.pool.ntp.org #/' /root/controller/CONFIGURACAO.conf
sed -i 's/CONFIG_PROVISION_DEMO=/CONFIG_PROVISION_DEMO=n #/' /root/controller/CONFIGURACAO.conf
sed -i 's/CONFIG_KEYSTONE_ADMIN_PW=/CONFIG_KEYSTONE_ADMIN_PW=SENHA #/' /root/controller/CONFIGURACAO.conf
sed -i 's/CONFIG_HORIZON_SSL=/CONFIG_HORIZON_SSL=y #/' /root/controller/CONFIGURACAO.conf
sed -i 's/CONFIG_MARIADB_PW=/CONFIG_MARIADB_PW=SENHA #/' /root/controller/CONFIGURACAO.conf
#sed -i 's/CONFIG_NAGIOS_PW=nagios1234 #/' /root/controller/CONFIGURACAO.conf
sed -i 's/PermitRootLogin yes #/' /etc/ssh/sshd_config
systemctl restart sshd
#systemctl status sshd
packstack --answer-file CONFIGURACAO.conf
