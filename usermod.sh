#!/bin/bash

read -p "Ingresa un usuario: " usr
read -p "Usuario $usr:
	1) Cambiar login de usuario
	2) Bloquear contraseña
	3) Desbloquear contrseña
	4) Modificar comentario
	5) Establecer directorio HOME
	6) Mover directorio HOME
	7) Establecer/Cambiar fecha de expiración de usuario
	8) Reemplazar grupo primario de usuario
	9) Reemplazar grupos secundarios de usuario
	10) Agregar usuario a grupos" op

if [ $op -eq 1 ]
then
	read -p "Ingresa el nuevo login de usuario" login
	usermod -l $login $usr
	echo "Nuevo login"
	
fi

if [ $op -eq 2 ]
then
	usermod -L $usr
fi

if [ $op -eq 3 ]
then
	usermod -U $usr
fi

if [ $op -eq 4 ]
then
	read -p "Ingresa un comentario: " commit
	usermod -c $commit $usr
fi

if [ $op -eq 5 ]
then
	read -p "Ingresa la ruta del directorio home  EJ:/home/USUARIO/ : " home
	usermod -d $home $usr
fi

if [ $op -eq 6 ]
then
	read -p "Ingresa la ruta del directorio home donde se va a mover : " mvhome
	usermod -m -d $mvhome $usr
fi

if [ $op -eq 7 ]
then
	read -p "ingresa la expiración del usuario " fecha
	usermod -e $fecha $usr
fi

#Desde acá en adelante ni idea como estructurar esto hoy, tengo sueño
if [ $op -eq 8 ]
then
	read -p "Ingresa un grupo " grupo1
	usermod -g $grupo1 $usr
fi

if [ $op -eq 9 ]
then
	read -p "Ingresa un grupo " grupo2
	usermod -G $grupo2 $usr
fi

#Posiblemente esto no funca y creashea todo al carajo
if [ $op -eq 10 ]
then
	usermod -a -G $grupos $usr
fi

done
