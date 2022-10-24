#!/bin/bash


sudo mysql -u root -e "select count(E.cedEst) as CantidadEstudiantes, C.idCursa as IdCurso, C.idMat as IdMateria, C.idGrupo as IdGrupo from Pertenece P join Estudiante E on E.cedEst = P.cedEst join Cursa C on C.idCursa = P.idCursa group by C.idCursa;"
