#!/bin/bash

clear
continuar=1
clear
while [ $continuar -eq 1 ]
do
echo "Ingresa una opción
	1) ABM de usuario
	2) ABM de grupo
	3) Test de conexión a internet
	4) Actualizar sistema
	5) Salir del programa"
read -p "Ingresa una opción: " op

	if [ $op -eq 1 ]
	then
	continuar=2
	./ABMu.sh
	fi

	if [ $op -eq 2 ]
	then
	continuar=2
	./ABMg.sh
	fi

	if [ $op -eq 3 ]
	then
	./testinternet.sh
	fi

	if [ $op -eq 4 ]
	then
	./apt.sh
	fi

	if [ $op -eq 5 ]
	then
	clear
	exit 0
	fi
clear
done
