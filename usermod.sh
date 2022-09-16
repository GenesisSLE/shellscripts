#!/bin/bash
continuar=1
grupos=0

while [ $continuar -eq 1 ]
do
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
	10) Agregar usuario a grupos secundarios $grupos / 3
	11) Volver al menú de usuarios
	12) Volver al menú principal" op

if [ $op -eq 1 ]
then
	read -p "Ingresa el nuevo login de usuario" login
	usermod -l $login $usr
	echo "Nuevo login"
	continuar=2
fi

if [ $op -eq 2 ]
then
	usermod -L $usr
	continuar=2
fi

if [ $op -eq 3 ]
then
	usermod -U $usr
	continuar=2
fi

if [ $op -eq 4 ]
then
	read -p "Ingresa un comentario: " commit
	usermod -c $commit $usr
	continuar=2
fi

if [ $op -eq 5 ]
then
	read -p "Ingresa la ruta del directorio home  EJ:/home/USUARIO/ : " home
	usermod -d $home $usr
	continuar=2
fi

if [ $op -eq 6 ]
then
	read -p "Ingresa la ruta del directorio home donde se va a mover : " mvhome
	usermod -m -d $mvhome $usr
	continuar=2
fi

if [ $op -eq 7 ]
then
	read -p "ingresa la expiración del usuario " fecha
	usermod -e $fecha $usr
	continuar=2
fi

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

if [ $op -eq 10 ]
then
	if [ $grupos -lt 3 ]
	then
		usermod -a -G $grupos $usr
	else
		echo "No puedes agregar más grupos secundarios!"
	fi
fi

if [ $op -eq 11 ]
then
	./ABMu.sh
fi

if [ $op -eq 12 ]
then
	./start.sh
fi

done
