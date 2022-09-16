#!/bin/bash
continuar=1
while [ $continuar -eq 1 ]
do
clear
read -p "Ingresa un nombre: " op

echo "El grupo que se creará es:"
echo $op
read -p "Estás seguro? [y/n]" op2

if [ "$op2" = "y" ]
then
groupadd $op

grep $op /etc/group

echo "El grupo fue creado y validao correctamente!"
fi

if [ "$op2" = "n" ]
then
./groupadd.sh
fi

read -p "Que deseas hacer?
	1) Volver a crear un grupo
	2) Volver al menú de grupo
	3) Volver al menú principal" op1

if [ $op1 -eq 1 ]
then
	./groupadd.sh
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
