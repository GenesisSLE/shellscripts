#!/bin/bash

continuar=1
clear

read -p "Ingresa un nombre: " op

read -p "Quieres ingresar a un grupo? [y/n] " yn 

if [ "$yn" = "y" ]
then
groups
echo "Estos son los grupos disponibles"
read -p "Selecciona un grupo: " op2
fi

read -p "Quieres agregar un comentario? [y/n] " yn2

if [ "$yn2" = "y" ]
then
read -p "Ingresa un comentario: " com
echo "Escribiste"
echo $com
read -p "Estás seguro que deseas agregarlo? [y/n] " syn1
fi

read -p "Quieres cambiar el directorio HOME del usuario? [y/n]" yn3
if [ "$yn3" = "y" ]
then
read -p "Ingresa la ruta del nuevo directorio HOME (EJ: /home/nuevacasa/profesor) " dir
echo "Escribiste"
echo $dir
read -p "Estás seguro que este va a ser el directorio HOME? [y/n] " syn2
fi

useradd $op
passwd $op

if [ "$yn" = "y" ]
then
usermod -a -G $op2 $op
fi

if [ "$syn1" = "y" ]
then
usermod -c $com $op
fi

if [ "$syn2" = "y" ]
then
usermod -d $dir $op
fi

echo "El usuario:"
grep $op /etc/passwd
echo "Fue creado y validado correctamente!"

read -p "Qué desea hacer?
	1) Volver a crear un usuario
	2) Volver al menú de usuario 
	3) Volver al menú principal " op

if [ $op -eq 1 ]
then
./useradd.sh
fi

if [ $op -eq 2 ]
then
./ABMu.sh
fi

if [ $op -eq 3 ]
then
./start.sh
fi

done
