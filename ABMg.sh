#!/bin/bash

continuar=1
clear

while [ $continuar -eq 1 ]
do
read -p "Selecciona una opcion
1) Agregar grupo
2) Eliminar grupo
3) Volver al menú principal " op
	if [ $op -eq 1 ]
	then
	continuar=2
	./groupadd.sh
	fi

	if [ $op -eq 2 ]
	then
	continuar=2
	./groupdel.sh
	fi

	if [ $op -eq 4 ]
	then
	continuar=2
	./start.sh
	fi
done
