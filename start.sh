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
	5) Comprobar existencia de usuarios en la base de datos
	6) Administrar servicios
	7) Usuarios conectados al servidor
	8) Mostrar cantidad de alumnos por curso
	9) Cargar archivos CSV
	10) Realizar copia de seguridad de la base de datos
	11) Mostrar inasistencias de docentes por grupo
	12) Mostrar login de usuarios en la app web
	13) Mostrar promedio de materias por cada curso
	14) Mostrar reuniones
	15) Definir respaldo manualmente
	16) Salir del programa: "

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
		./dbusuarios.sh
	fi

	if [ $op -eq 6 ]
	then
		./servicios.sh
	fi

	if [ $op -eq 7 ]
	then
		./conn_usuarios.sh
	fi

  	if [ $op -eq 8 ]
        then
                ./cant_alumnos_curso.sh
        fi

  	if [ $op -eq 9 ]
        then
                ./csv.sh
        fi

  	if [ $op -eq 10 ]
        then
                ./dbbackup.sh
        fi

  	if [ $op -eq 11 ]
        then
                ./inasistencias_profesor.sh
        fi

  	if [ $op -eq 12 ]
        then
                ./login_usuarios.sh
        fi

  	if [ $op -eq 13 ]
        then
                ./promedio_materias.sh
        fi

  	if [ $op -eq 14 ]
        then
                ./reuniones.sh
        fi

	if [ $op -eq 15 ]
	then
		continuar=2
		./prog_backup.sh
	fi

	if [ $op -eq 16 ]
	then
		clear
		exit 0
	fi
clear
done
