#!/bin/bash


sudo mysql -u genesis -pgenesis -e "USE genesis_sle; select avg(nota), G.orientacion as Orientacion, G.grado as Grado, A.nombre as NombreMateria from Trabaja T join Asignatura A on T.idMat = A.idMat join Estudiante E on E.cedEst = T.cedEst join Cursa C on C.idMat = A.idMat join Grupo G on G.idGrupo = C.idGrupo group by A.nombre, G.grado, G.orientacion;"
