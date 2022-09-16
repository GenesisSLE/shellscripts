#!/bin/bash

continuar=1
while [ $continuar -eq 1 ]
do
clear

cat /etc/group
echo "Grupos disponibles"
read -p "Cual deseas eliminar? " op

echo "Vas a eliminar el grupo"
$op
read -p "Estás seguro?" yn

if [ "$yn" = "y" ]
then
	groupdel $op
	grep $op /etc/group
	echo "Grupo validado y eliminado"
fi

if [ "$yn" = "n" ]
then
	./groupdel.sh
fi

read -p "Que deseas hacer?
	1) Eliminar otro usuario
	2) Volver al menú de usuario
	3) Volver al menú principal" op1

if [ $op1 -eq 1 ]
then
	./groupdel.sh
fi

if [ $op1 -eq 2 ]
then
	continuar=2
	./ABMu.sh
fi

if [ $op1 -eq 3 ]
then
	continuar=2
	./start.sh
fi

done
