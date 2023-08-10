CREATE VIEW listarAsistencias AS
 SELECT ciudadanos.cedula as "Cedula",
    ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1)) AS "Nombres",
    age((CURRENT_DATE)::timestamp with time zone, (ciudadanos.fecha_nacimiento)::timestamp with time zone) AS "Edad",
    asistencias.hora_inicial as "Asistencia entrada",
    asistencias.hora_final as "Asistencia salida",
    areas.nombre as "Area",
    asistencias.fecha as "Fecha"
   FROM empleados
     JOIN ciudadanos ON ciudadanos.id_ciudadano = empleados.ciudadano
     JOIN areas ON areas.id_area = empleados.area
     JOIN asistencias ON asistencias.empleado = empleados.id_empleado
  WHERE     
    NOT 
        empleados.eliminado 
    AND 
        empleados.tipo = 'Empleado'::tipo_rol
  ORDER BY ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1))
 LIMIT 100;
