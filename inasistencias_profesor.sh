#!/bin/bash


sudo mysql -u root -e "select sum(if(claseDic = 0, 1, 0)) as ClasesNoDictadas, G.orientacion as Orientacion, G.grado as GradoGrupo, A.nombre as NombreAsignaura from Dicta D join Clase C on C.idClase = D.idClase join Tiene2 T on T.idClase = C.idClase join Cursa Cu on T.idCursa = Cu.idCursa join Asignatura A on A.idMat = Cu.idMat join Grupo G on G.idGrupo = Cu.idGrupo;"
