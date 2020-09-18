#!/bin/bash
# Script de instalación de PandoraFMS Community
# (C) Guillermo Sanchez gsanchez@sitssoluciones.com
# https://pandorafms.com.ar 
# PandoraFMS Enterprise Certified Partner

# Ajustes Iniciales
echo 'Ajustes selinux'
sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
setenforce 0

echo 'Desabilitando Firewalld'
systemctl stop firewalld 
systemctl disable firewalld

echo 'Ajustes idioma'
echo 'LANG=en_US.utf-8' >> /etc/environment
echo 'LC_ALL=en_US.utf-8' >> /etc/environment

echo 'Actualizando Sistema operativo'
yum makecache
yum -y upgrade 
echo 'Agregando el repositorio EPEL'
yum -y install epel-release

echo 'Actualizando paquetes PHP 7.x'
yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install yum-utils
yum-config-manager --enable remi-php74

echo 'Instalando dependencias....'
yum -y install mariadb-server httpd mod_php mod_ssl php-gd php-mysql php-mbstring xorg-x11-fonts-misc graphviz php-snmp php-pear php-ldap php-pear-DB xorg-x11-fonts-75dpi graphviz
yum -y install php php-gd graphviz php-mysql php-pear-DB php-zip php-mbstring php-ldap php-snmp php-ldap php-common make perl-CPAN perl-HTML-Tree perl-DBI perl-DBD-mysql perl-libwww-perl perl-XML-Simple perl-XML-Twig perl-XML-SAX perl-NetAddr-IP net-snmp perl-SNMP net-tools perl-IO-Socket-INET6 perl-Socket6 nmap sudo xprobe2 perl-Encode-Locale php-xmlrpc libxslt php-xml
yum -y install net-snmp-perl perl-JSON perl-NetAddr-IP perl-Socket6 perl-Time-HiRes perl-XML-Twig perl-IO-Socket-INET6
yum -y install php php-common graphviz php-fpm
yum -y install perl-HTML-Tree perl-DBD-mysql perl-XML-Simple perl-XML-SAX perl-NetAddr-IP net-snmp perl-SNMP net-tools perl-IO-Socket-INET6 perl-Socket6 nmap
yum -y install snmp snmpd libtime-format-perl libxml-simple-perl libxml-twig-perl libdbi-perl libnetaddr-ip-perl libhtml-parser-perl wmi-client xprobe2 nmap libmail-sendmail-perl traceroute 
yum -y install libio-socket-inet6-perl libhtml-tree-perl libsnmp-perl snmp-mibs-downloader libio-socket-multicast-perl libsnmp-perl libjson-per 
echo 'Configurando password root mysql... la misma es: pandora'
echo 'Configurando mariadb (mysql)'
systemctl start mariadb
mysql -u root -e "SET PASSWORD FOR root@localhost = PASSWORD('pandora')";
systemctl enable mariadb
echo 'Configurando apache (httpd)'
systemctl enable httpd
systemctl start httpd
systemctl enable php-fpm
systemctl start php-fpm

echo 'Cargando Repositorio Pandora FMS'
cat <<EOF > /etc/yum.repos.d/PandoraFMS.repo
[artica_pandorafms]
name=CentOS7 - PandoraFMS official repo
baseurl=http://firefly.artica.es/centos7
gpgcheck=0
enabled=1
EOF
yum makecache
yum -y install pandorafms_console pandorafms_server

echo 'reiniciando apache'
systemctl restart httpd

echo 'termine la instalacion desde el navegador'
ip=$(hostname -I|sed "s/ //g")
echo 'https://'$ip'/pandora_console'
echo 'la password para el usuario root en mysql es: pandora (Importante: tomar Nota)'
