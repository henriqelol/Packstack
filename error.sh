sed -i 's/Listen 443 https/#Listen 443 https/' /etc/httpd/conf.d/ssl.conf
systemctl restart httpd.service

#Editar conforme apresentar erros ou sair atualizações