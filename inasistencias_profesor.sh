#!/bin/bash
clear
sudo mysql -u genesis -pgenesis -e "USE genesis_sle; select sum(if(claseDic = 0, 1, 0)) as ClasesNoDictadas, G.orientacion as Orientacion, G.grado as GradoGrupo, A.nombre as NombreAsignaura from dicta D join clase C on C.idClase = D.idClase join tiene2 T on T.idClase = C.idClase join cursa Cu on T.idCursa = Cu.idCursa join asignatura A on A.idMat = Cu.idMat join grupo G on G.idGrupo = Cu.idGrupo GROUP BY G.idGrupo, G.orientacion, A.nombre;"
echo "Regresando al menú principal en 10 segundos..."
sleep 10
