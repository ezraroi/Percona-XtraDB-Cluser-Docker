#!/bin/bash
set -e

if [ "$1" = 'init' ]
then
    echo "*******************Initalzing DB**********************************"
    mysqld --initialize-insecure --user=mysql
fi
echo "*******************Starting DB**************************"
exec mysqld

