#!/bin/bash

echo "Usuarios disponibles:"
cat /etc/passwd
read -p "Que usuario deseas borrar?: " op

echo "ADVERTENCIA: ESTA ACCIÓN ES IRREVERSIBLE. GENESIS NO SE HACE RESPONSABLE DE LO QUE PUEDA OCURRIR"
echo "Vas a borrar a el usuario: "
echo $op
read -p "Continuar? [y/n] " yn

if [ "$yn" == "y" ]
then
userdel $op
grep $op /etc/passwd
echo "Usuario borrado correctamente!"
fi

read -p "Que deseas hacer?
	1) Borrar otro usuario
	2) Volver al menú de usuario
	3) Volver al menú principal " op

if [ $op -eq 1 ]
then
./userdel.sh
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
