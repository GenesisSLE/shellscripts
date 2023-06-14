#!/bin/bash
continuar=1
clear

while [ $continuar -eq 1 ]
do
echo "Syntax de CRON: m h d month dow COMANDO"

read -p "Selecciona como quieres respaldar el sistema
	1) Manual
	2) Intervalo fijo
	3) Volver al menú principal " tipo
clear
if [ $tipo -eq 1 ]
then
#MINUTO
read -p "Establece el minuto en el que se tiene que ejecutar el respaldo [0-59]
	* = Ignora el valor
	*/15 = Cada 15 minutos
	*/20 = Cada 20 minutos
	etc... " m

read -p "Estás seguro? [y/n] " yn
if [ "$yn" = "y" ]
then
echo Minuto o intervalo $m establecido correctamente
fi
if [ "$yn" = "n" ]
then
	m=
	./prog_backup.sh
fi

#HORA
read -p "Establece la hora o define el intervalo en el que se tiene que ejecutar el respaldo [0-23]
        * = Ignora el valor
        */2 = Cada 2 horas
        */4 = Cada 4 horas
        etc... " h

read -p "Estás seguro? [y/n] " yn1
if [ "$yn1" = "y" ]
then
	echo Hora o intervalo $h establecida correctamente
fi
if [ "$yn1" = "n" ]
then
	h=
	./prog_backup.sh
fi

#DIA
read -p "Establece el día o define el intervalo en el que se tiene que ejecutar el respaldo [1-31]
        * = Ignora el valor
        */2 = Cada 2 días
        */4 = Cada 4 días
        etc... " d
read -p "Estás seguro? [y/n] " yn2
if [ "$yn2" = "y" ]
then
	echo Día o intervalo $d establecido correctamente
fi
if [ "$yn2" = "n" ]
then
	d=
        ./prog_backup.sh
fi

#MES
read -p "Establece el mes o define el intervalo en el que se tiene que ejecutar el respaldo [1-12]
        * = Ignora el valor
        */2 = Cada 2 meses
        */4 = Cada 3 meses
        etc... " mo
read -p "Estás seguro? [y/n] " yn3
if [ "$yn3" = "y" ]
then
	echo Mes o intervalo $mo establecido correctamente
fi
if [ "$yn3" = "n" ]
then
	mo=
        ./prog_backup.sh
fi

#DIA DE LA SEMANA
read -p "Establece el día de la semana en el que se tiene que ejecutar el respaldo [0-6]
	0 - Domingo
	1 - Lunes
	2 - Martes
	3 - Miércoles
	4 - Jueves
	5 - Viernes
	6 - Sábado" dow
if [ $dow -le 6 ]
then
	read -p "Estás seguro? [y/n] " yn3
	if [ "$yn3" = "y" ]
	then
        	echo Día del mes $dow establecido correctamente
	fi
	if [ "$yn3" = "n" ]
	then
        	dow=
        	./prog_backup.sh
	fi
elif [ dow -gt 6 ]
then
	dow=
	echo "No se puede agregar un día de la semana mayor a 6 ya que no existe"
fi


ls -a /home/admgenesis
read -p "Selecciona que carpeta del sistema quieres hacerle un comprimido " folder
progtarea = $m $h $d $mo $dow tar -zcf /home/admgenesis/$folder.tgz /home/admgenesis/$folder/
echo $progtarea
sudo cat $progtarea >> /var/spool/cron/crontabs/admgenesis
fi

if [ $tipo -eq 2 ]
then

read -p "Establece el intervalo en el que se tiene que ejecutar el respaldo
        @reboot = Cada reinicio
        @hourly = Cada hora
        @daily = Cada dia
        @weekly = Cada semana
	@monthly = Cada mes
	@yearly = Cada año " t

if [ "$t" = "@reboot" ]
then
	read -p "Estás seguro de hacerlo cada reinicio? [y/n] " yn2
	if [ "$yn2" = "y" ]
	then
        	echo Intervalo $t establecido correctamente
	fi
	if [ "$yn2" = "n" ]
	then
        	t=
        	./prog_backup.sh
	fi
fi

if [ "$t" = "@hourly" ]
then
        read -p "Estás seguro de hacerlo cada hora? [y/n] " yn2
        if [ "$yn2" = "y" ]
        then
                echo Intervalo $t establecido correctamente
        fi
        if [ "$yn2" = "n" ]
        then
                t=
                ./prog_backup.sh
        fi
fi

if [ "$t" = "@daily" ]
then
        read -p "Estás seguro de hacerlo cada daily? [y/n] " yn2
        if [ "$yn2" = "y" ]
        then
                echo Intervalo $t establecido correctamente
        fi
        if [ "$yn2" = "n" ]
        then
                t=
                ./prog_backup.sh
        fi
fi

if [ "$t" = "@weekly" ]
then
        read -p "Estás seguro de hacerlo cada semana? [y/n] " yn2
        if [ "$yn2" = "y" ]
        then
                echo Intervalo $t establecido correctamente
        fi
        if [ "$yn2" = "n" ]
        then
                t=
                ./prog_backup.sh
        fi
fi

if [ "$t" = "@monthly" ]
then
        read -p "Estás seguro de hacerlo cada mes? [y/n] " yn2
        if [ "$yn2" = "y" ]
        then
                echo Intervalo $t establecido correctamente
        fi
        if [ "$yn2" = "n" ]
        then
                t=
                ./prog_backup.sh
        fi
fi

if [ "$t" = "@yearly" ]
then
        read -p "Estás seguro de hacerlo cada año? [y/n] " yn2
        if [ "$yn2" = "y" ]
        then
                echo Intervalo $t establecido correctamente
        fi
        if [ "$yn2" = "n" ]
        then
                t=
                ./prog_backup.sh
        fi
fi
read -p "Selecciona que carpeta del sistema quieres hacerle un comprimido " folder
progtarea2 = $t tar -zcf /home/admgenesis/$folder.tgz /home/admgenesis/$folder/
echo $progtarea2
sudo cat $progtarea2 >> /var/spool/cron/crontabs/admgenesis
fi

if [ $tipo -eq 3 ]
then
continuar=2
./start.sh
fi

done
