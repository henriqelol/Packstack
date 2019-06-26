# Packstack
**Instalação do Openstack com o [Packstack](https://github.com/nu11secur1ty/Install-Cloud-Platform-with-OpenStack-in-RHEL-CentOS-7/blob/master/install_Openstack.md) no Centos 07**

Antes de executar, verifique:
 - As configurações conforme a sua máquina.
 - Altere onde está escrito `SENHA`.


Execute na máquina:
~~~
sh install.sh
~~~

Acesse `IP/dashboard` no navegador:

~~~
https://192.168.1.40/dashboard
~~~

## NOTAS
1 - Caso apresente algum erro execute o arquivo abaixo:
~~~
error.sh
~~~

2 - Caso ainda não consiga navegar no painel da web do Openstack na porta 443, altere o caminho abaixo no arquivo `install.sh` e reinicie o processo de instalação.
~~~
packstack --answer-file /root/13.04.16.conf
~~~
