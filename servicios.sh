#!/bin/bash
clear
continuar=0
while [ $continuar -eq 0 ]
do
op1=0
op=0
read -p "Selecciona una opción
	1) Iniciar
	2) Detener
	3) Reiniciar" op1

if [ $op1 -eq 1 ]
then
read -p "Selecciona que servicios quieres iniciar
        1) Web (Apache)
        2) FTP
        3) MySQL" op

	if [ $op -eq 3 ]
	then
        	sudo systemctl start mysql-server
        	echo "MySQL iniciado correctamente"
	fi

	if [ $op -eq 2 ]
	then
        	sudo systemctl start vsftpd
        	echo "FTP reinicado correctamente"
	fi

	if [ $op -eq 1 ]
	then
        	sudo systemctl start apache2
        	echo "Apache inciado correctamente"
	fi
fi

if [ $op1 -eq 2 ]
then
read -p "Selecciona que servicios quieres detener
        1) Web (Apache)
        2) FTP
        3) MySQL" op

        if [ $op -eq 3 ]
        then
                sudo systemctl stop mysql-server
                echo "MySQL detenido correctamente"
        fi

        if [ $op -eq 2 ]
        then
                sudo systemctl stop vsftpd
                echo "FTP detenido correctamente"
        fi

        if [ $op -eq 1 ]
        then
                sudo systemctl stop apache2
                echo "Apache detenido correctamente"
        fi
fi

if [ $op1 -eq 3 ]
then
read -p "Selecciona que servicios quieres reiniciar
	1) Web (Apache)
	2) FTP
	3) MySQL" op

	if [ $op -eq 3 ]
	then
		sudo systemctl restart mysql-server
		echo "MySQL reinciado correctamente"
	fi

	if [ $op -eq 2 ]
	then
		sudo systemctl restart vsftpd
		echo "FTP reinicado correctamente"
	fi

	if [ $op -eq 1 ]
	then
		sudo systemctl restart apache2
		echo "Apache reinciado correctamente"
	fi

fi
done
