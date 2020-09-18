#!/bin/bash
# Script de instalación de PandoraFMS Community
# (C) Guillermo Sanchez gsanchez@sitssoluciones.com
# https://pandorafms.com.ar
# PandoraFMS Enterprise Certified Partner
echo 'Copiando archivos'
\cp ./php/config.php /var/www/html/pandora_console/include/
chown apache.apache /var/www/html/pandora_console/include/config.php
\cp ./php/php.ini /etc/php.ini
echo 'Ajustando dependencias'
yum -y install xprobe2
yum -y install ./rpms/wmi-1.3.14-4.el7.art.x86_64.rpm

echo 'Instalando Phantomjs'
yum install -y dnf
dnf install -y glibc fontconfig
yum install -y lbzip2
yum install -y fontconfig
yum install -y freetype
yum install -y wget
yum install -y bzip2
cd /opt
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar -xvf phantomjs-2.1.1-linux-x86_64.tar.bz2
cp /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/

echo 'Seteando Password usuario pandora'
mysql -u root -ppandora -e "SET PASSWORD FOR pandora@localhost = PASSWORD('pandora')";

echo 'Ajustando php.ini'
# Prepare php.ini
sed -i -e "s/^max_input_time.*/max_input_time = -1/g" /etc/php.ini
sed -i -e "s/^max_execution_time.*/max_execution_time = 0/g" /etc/php.ini
sed -i -e "s/^upload_max_filesize.*/upload_max_filesize = 800M/g" /etc/php.ini
sed -i -e "s/^memory_limit.*/memory_limit = 500M/g" /etc/php.ini

echo 'Configurando Pandora Server'
systemctl enable pandora_server
systemctl start pandora_server
systemctl status tentacle_serverd
systemctl enable tentacle_serverd

echo 'Reiniciando apache (httpd)'
systemctl restart httpd
echo 'Operacion Finalizada'
