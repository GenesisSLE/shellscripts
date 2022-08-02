#!/bin/bash

clear

cat /etc/group
echo "Grupos disponibles"
read -p "Cual deseas eliminar? " op

grep $op /etc/group

groupdel $op

echo "Grupo eliminado"

done
