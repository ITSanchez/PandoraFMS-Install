#!/bin/bash
# Script de instalación de PandoraFMS Community
# (C) Guillermo Sanchez gsanchez@sitssoluciones.com
# https://pandorafms.com.ar
# PandoraFMS Enterprise Certified Partner
echo 'Instalando Dependencias Enterprise'
yum -y install fping

echo 'Descargando paquetes...'
cd rpms

./GetEnterprise

echo 'Actualizando Consola WEB...'
yum install -y ./pandorafms_console_enterprise.noarch.rpm
echo 'Actualizando Servidor Pandora a Enterprise...'

tar xvzf ./pandorafms_server_enterprise.tar.gz

cd pandora_server
./pandora_server_installer --install
cd ..
\cp ./pandora_server.conf /etc/pandora/
echo 'Reinciando Servicios'
systemctl daemon-reload
systemctl restart httpd
systemctl restart pandora_server
