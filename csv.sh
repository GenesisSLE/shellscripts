#!/bin/bash
op=0
while [ $op -eq 0 ]
do
clear
read -p "Ingresa la ruta del archivo CSV" ruta 

if [[ -z $ruta ]]
then
	op=1
elif [[ -f $ruta ]]
then 
	clear
	cat $ruta | column -s "," -t

oop=0
while [[ $op -eq 0 ]]
do
	read -p "Quieres ingresar los datos?
		 1: Si
	 	2: No" oop
if [[ -z $oop ]]
then 
	oop=0

elif [[ $oop -eq 1 ]]
then 
	head -1 $ruta > .scripts/Columnas.txt
	numli=`wc -l $ruta | cut -f1 -d " "`
	sed 's/,/","/g' $ruta > .scripts/Datos.txt
	e=2
while [ $e -le $numli ]
do
	Tablas=`cat .scripts/Columnas.txt`
	Datos=`head -$e .scripts/Datos.txt | tail -1`
	Datos='"'$Datos'"'
		mysql -u genesis -pgenesis -e "use genesis_sle;insert into Persona($Tablas) values ($Datos);"
	e=`expr $e + 1`
done
	clear
	echo "Los datos fueron ingresados correctamente!"
sleep 2s
oop=1
op=1

elif [[ $oop -eq 2 ]]
then
	oop=1
	op=1
else
	oop=0
fi
done

else
clear
	echo "El archivo no existe"
sleep 2s
op=0
fi
done
