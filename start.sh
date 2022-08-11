#!/bin/bash

clear
continuar=1
clear
while [ $continuar -eq 1 ]
do
echo "Ingresa una opción
	1) ABM de usuario
	2) ABM de grupo"
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
clear
done
