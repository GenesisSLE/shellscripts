#!/bin/bash

clear

read -p "Ingresa un nombre: " op

echo "El grupo que se creará es:"
echo $op
read -p "Estás seguro? [y/n]" op2

if [ "$op2" = "y" ]
then
groupadd $op
fi

if [ "$op2" = "n" ]
then
./groupadd.sh
fi

done
