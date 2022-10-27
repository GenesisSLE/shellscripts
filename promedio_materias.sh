#!/bin/bash


sudo mysql -u genesis -pgenesis -e "USE genesis_sle; select avg(nota), G.orientacion as Orientacion, G.grado as Grado, A.nombre as NombreMateria from trabaja T join asignatura A on T.idMat = A.idMat join estudiante E on E.cedEst = T.cedEst join cursa C on C.idMat = A.idMat join grupo G on G.idGrupo = C.idGrupo group by A.nombre, G.grado, G.orientacion;"
