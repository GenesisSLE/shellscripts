#!/bin/bash
clear
sudo mysql -u genesis -pgenesis -e "USE genesis_sle; select count(E.cedEst) as CantidadEstudiantes, C.idCursa as IdCurso, C.idMat as IdMateria, C.idGrupo as IdGrupo from pertenece P join estudiante E on E.cedEst = P.cedEst join cursa C on C.idCursa = P.idCursa GROUP BY C.idCursa, C.idMat, C.idGrupo;"
echo "Regresando al menú principal en 10 segundos..."
sleep 10
