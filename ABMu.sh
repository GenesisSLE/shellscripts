#!/bin/bash

continuar=1
clear

while [ $continuar -eq 1 ]
do
read -p "Selecciona una opcion
1) Agregar usuario
2) Eliminar usuario
10) Salir " op
	if [ $op -eq 1 ];
	then
	continuar=2
	./useradd.sh
	fi

	if [ $op -eq 2 ];
	then
	continuar=2
	./userdel.sh
	fi

	if [ $op -eq 10 ];
	then
	continuar=2
	./start.sh
	fi
done