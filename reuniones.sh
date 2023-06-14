#!/bin/bash
clear
continuar=1
while [ $continuar -eq 1 ]
do
read -p "Ingresa un dia " dia

if [ $dia -ge 1 ]
then
	if [ $dia -le 31 ]
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
	fi
elif [ $dia -gt 31 ]
then
	dia=
	echo "No se puede agregar un dia mayor a 31 ya que no existe"
        sleep 5
        ./reuniones.sh
fi

read -p "Ingresa un mes " mes
if [ $mes -ge 1 ]
then
	if [ $mes -le 12 ]
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
	fi
elif [ $mes -gt 12 ]
then
        mes=
        echo "No se puede agregar un mes mayor a 12 ya que no existe"
	sleep 5
	./reuniones.sh
fi

read -p "Ingresa un año " year
if [ $year -ge 2020 ]
then
	if [ $year -le 2099 ]
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
	fi
elif [ $year -gt 9999 ]
then
        dia=
        echo "No se puede agregar un año mayor a 9999 ya que no está admitido por el sistema"
        sleep 5
        ./reuniones.sh
fi

read -p "Ingresa una hora " hora
if [ $hora -ge 00 ]
then
	if [ $hora -le 12 ]
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
	fi
elif [ $hora -gt 12 ]
then
        hora=
        echo "No se puede agregar una hora mayor a 12 ya que no existe"
        sleep 5
        ./reuniones.sh
fi

read -p "Ingresa el/los minuto/s " minutos
if [ $minutos -ge 00 ]
then
	if [ $minutos -le 59 ]
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
	fi
elif [ $minutos -gt 59 ]
then
        minutos=
        echo "No se puede agregar mas de 59 minutos ya que no existen"
        sleep 5
        ./reuniones.sh
fi

read -p "Ingresa el/los segundo/s " segundos
if [ $segundos -ge 00 ]
then
	if [ $segundos -le 59 ]
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
	fi
elif [ $segundos -gt 59 ]
then
        segundos=
        echo "No se puede agregar mas de 59 segundos ya que no existen"
        sleep 5
        ./reuniones.sh
fi
fecha="$year-$mes-$dia"
hora="$hora:$minutos:$segundos"
echo $fecha
echo $hora
read -p "Establece una id de grupo " id
if [ $id -ge 1 ]
then
	if [ $id -le 3 ]
	then
	mysql -u genesis -pgenesis -e "USE genesis_sle; insert into reunion (numReun) values ("$id");"
	fi
elif [ $id -ge 3 ]
then
	echo "No existe una id de grupo mayor a 3"
	sleep 5
	./reuniones.sh
fi

read -p "Ingresa un num de reunión " num
if [ ! -z $num ]
then
	mysql -u genesis -pgenesis -e "USE genesis_sle; insert into emite (idReunion, idGrupo, fecha) values ((select MAX(idReunion) from reunion), '$num', '$fecha $hora');"
	mysql -u genesis -pgenesis -e "USE genesis_sle; SELECT * from emite"
elif [ -z $num ]
then
echo "No se ingresó una id de reunión"
fi
echo "Regresando al menú principal en 10 segundos..."
continuar=1
sleep 10
./start.sh
done
