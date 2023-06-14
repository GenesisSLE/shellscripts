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
	3) Reiniciar
	4) Comprobar estado de servicios
	5) Menú principal :" op1

if [ $op1 -eq 1 ]
then
read -p "Selecciona que servicios quieres iniciar
        1) Web (Apache)
        2) FTP
        3) MySQL :" op

	if [ $op -eq 3 ]
	then
        	sudo systemctl start mysql
		sudo systemctl status mysql
        	echo "MySQL iniciado correctamente"
	fi

	if [ $op -eq 2 ]
	then
        	sudo systemctl start vsftpd
		sudo systemctl status vsftpd
        	echo "FTP inicado correctamente"
	fi

	if [ $op -eq 1 ]
	then
        	sudo systemctl start apache2
		sudo systemctl status apache2
        	echo "Apache inciado correctamente"
	fi
fi

if [ $op1 -eq 2 ]
then
read -p "Selecciona que servicios quieres detener
        1) Web (Apache)
        2) FTP
        3) MySQL :" op

        if [ $op -eq 3 ]
        then
                sudo systemctl stop mysql
		sudo systemctl status mysql
                echo "MySQL detenido correctamente"
        fi

        if [ $op -eq 2 ]
        then
                sudo systemctl stop vsftpd
		sudo systemctl status vsftpd
                echo "FTP detenido correctamente"
        fi

        if [ $op -eq 1 ]
        then
                sudo systemctl stop apache2
		sudo systemctl status apache2
                echo "Apache detenido correctamente"
        fi
fi

if [ $op1 -eq 3 ]
then
read -p "Selecciona que servicios quieres reiniciar
	1) Web (Apache)
	2) FTP
	3) MySQL :" op

	if [ $op -eq 3 ]
	then
		sudo systemctl restart mysql
		sudo systemctl status mysql
		echo "MySQL reinciado correctamente"
	fi

	if [ $op -eq 2 ]
	then
		sudo systemctl restart vsftpd
		sudo systemctl status vsftpd
		echo "FTP reinicado correctamente"
	fi

	if [ $op -eq 1 ]
	then
		sudo systemctl restart apache2
		sudo systemctl status apache2
		echo "Apache reinciado correctamente"
	fi

fi

if [ $op1 -eq 4 ]
then
read -p "Selecciona que servicios quieres comprobar su estado
        1) Web (Apache)
        2) FTP
        3) MySQL :" op

        if [ $op -eq 3 ]
        then
                sudo systemctl status mysql
                echo "MySQL reinciado correctamente"
        fi

        if [ $op -eq 2 ]
        then
                sudo systemctl status vsftpd
                echo "FTP reinicado correctamente"
        fi

        if [ $op -eq 1 ]
        then
                sudo systemctl status apache2
                echo "Apache reinciado correctamente"
        fi

fi

if [ $op1 -eq 5 ]
then
	continuar=1
	./start.sh
fi
done
