#!/bin/bash
# Script de instalación de PandoraFMS Community
# (C) Guillermo Sanchez gsanchez@sitssoluciones.com
# https://pandorafms.com.ar
# PandoraFMS Enterprise Certified Partner
echo 'Instalando Dependencias Enterprise'
yum -y install fping

echo 'Actualizando Consola WEB...'
cd rpms
yum install -y ./pandorafms_console_enterprise-7.0NG.747.noarch.rpm
echo 'Actualizando Servidor Pandora a Enterprise...'

wget https://itsanchez.com.ar/sitsmon/pandorafms_server_enterprise-7.0NG.747_x86_64.tar.gz --no-check-certificate

tar xvzf ./pandorafms_server_enterprise-7.0NG.747_x86_64.tar.gz

cd pandora_server
./pandora_server_installer --install
cd ..
\cp ./pandora_server.conf /etc/pandora/
echo 'Reinciando Servicios'
systemctl restart httpd
systemctl restart pandora_server

