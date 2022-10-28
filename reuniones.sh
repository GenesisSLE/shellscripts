#!/bin/bash
clear
continuar=1
while [ $continuar -eq 1 ]
do
read -p "Ingresa un dia" dia

if [ $dia -ge 1 && -le 31 ]
then
	read -p "Estás seguro? [y/n] " yn
	if [ "$yn" = "y" ]
	then
        	echo Dia $dia establecido correctamente
	fi
	if [ "$yn" = "n" ]
	then
        	dia=
        	./reuniones.sh
	fi
elif [ dia -gt 31 ]
then
	dia=
	echo "No se puede agregar un dia mayor a 31 ya que no existe"
        sleep 5
        ./reuniones.sh
fi

if [ $mes -ge 1 && -le 12 ]
then
        read -p "Estás seguro? [y/n] " yn1
        if [ "$yn1" = "y" ]
        then
                echo Mes $mes establecido correctamente
        fi
        if [ "$yn1" = "n" ]
        then
                mes=
                ./reuniones.sh
        fi
elif [ mes -gt 12 ]
then
        mes=
        echo "No se puede agregar un mes mayor a 12 ya que no existe"
	sleep 5
	./reuniones.sh
fi

if [ $year -ge 2020 && -le 9999 ]
then
        read -p "Estás seguro? [y/n] " yn2
        if [ "$yn2" = "y" ]
        then
                echo Año $year establecido correctamente
        fi
        if [ "$yn2" = "n" ]
        then
                year=
                ./reuniones.sh
        fi
elif [ year -gt 9999 ]
then
        dia=
        echo "No se puede agregar un año mayor a 9999 ya que no está admitido por el sistema"
        sleep 5
        ./reuniones.sh
fi

if [ $hora -ge 00 && -le 23 ]
then
        read -p "Estás seguro? [y/n] " yn3
        if [ "$yn3" = "y" ]
        then
                echo Hora $hora establecida correctamente
        fi
        if [ "$yn3" = "n" ]
        then
                hora=
                ./reuniones.sh
        fi
elif [ hora -gt 23 ]
then
        hora=
        echo "No se puede agregar una hora mayor a 23 ya que no existe"
        sleep 5
        ./reuniones.sh
fi

if [ $minutos -ge 00 && -le 59 ]
then
        read -p "Estás seguro? [y/n] " yn4
        if [ "$yn4" = "y" ]
        then
                echo $minutos minutos establecidos correctamente
        fi
        if [ "$yn4" = "n" ]
        then
                minutos=
                ./reuniones.sh
        fi
elif [ minutos -gt 59 ]
then
        minutos=
        echo "No se puede agregar mas de 59 minutos ya que no existen"
        sleep 5
        ./reuniones.sh
fi

if [ $segundos -ge 00 && -le 23 ]
then
        read -p "Estás seguro? [y/n] " yn5
        if [ "$yn5" = "y" ]
        then
                echo  $segundos segundos establecidos correctamente
        fi
        if [ "$yn5" = "n" ]
        then
                segundos=
                ./reuniones.sh
        fi
elif [ segundos -gt 59 ]
then
        hora=
        echo "No se puede agregar mas de 59 segundos ya que no existen"
        sleep 5
        ./reuniones.sh
fi
fecha=$year-$mes-$dia $hora:$minutos:$segundos
echo "Establece una id de grupo " id
if [ $id -ge 1 && $id -le 3 ]
then
mysql -u genesis -pgenesis -e "USE genesis_sle; insert into Reunion (numReun) values ("$num");"
elif[ $id -ge 3 ]
then
echo "No existe una id de grupo mayor a 3"
sleep 5
./reuniones.sh
fi

echo "Ingresa un num de reunión " num
if [ ! -z $num ]
then
mysql -u genesis -pgenesis -e "USE genesis_sle; insert into Emite (idReunion, idGrupo, fecha) values ((select MAX(idReunion) from Reunion), "$num", "$fecha");"
mysql -u genesis -pgenesis -e "USE genesis_sle; SELECT * from emite"
elif [ -z $num ]
then
echo "No se ingresó una id de reunión"
fi
echo "Regresando al menú principal en 10 segundos..."
sleep 10
done
