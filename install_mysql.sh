#!/bin/bash
echo "--------Instalando MySQL-----"

yum install mysql-community-server

echo "-----Iniciando mysql-----"
service mysqld start

echo "-----Creando la base de datos y estableciendo permisos-----"
mysql -u root -p <<EOF
create user admin identified by 'Password123$';
grant all on *.* to 'admin'@'%' identified by 'Password123$';
flush privileges;
exit
EOF

echo "-----Creando base de datos,schemas y tablas-----"
mysql --user=admin --password=Password123$ <<EOF
create database if not exists angeles;
use angeles;
EOF

mysql --user=admin --password=Password123$ angeles < vitamedica-actual2.sql
echo "------Base de datos, schemas y tablas creados-----"

echo "-----Insertando datos a la tabla gri-----"
mysql --user=admin --password=Password123$ angeles <insert_gri.sql
mysql --user=admin --password=Password123$ angeles <insert_gri2.sql

echo "-----Insertando datos a la tabla diagnostico-----"
mysql --user=admin --password=Password123$ angeles <insert_diagnostico.sql


