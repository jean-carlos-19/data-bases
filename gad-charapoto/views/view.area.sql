/* Lista todas las areas con sus caracteristicas que tengan un estado activado*/
CREATE VIEW listarAreas AS
 SELECT areas.nombre AS area,
    nombres_coordinador_area(empleados.jefe_area) AS Coordinador,
    numeros_de_empleados(empleados.jefe_area) AS "Nº Empleados",
    age((CURRENT_DATE)::timestamp with time zone, (fecha_creacion_area(empleados.jefe_area))::timestamp with time zone) AS "Feacha creacion",
    ciudadanos.imagen as Imagen
   FROM empleados
     JOIN ciudadanos ON ciudadanos.id_ciudadano = empleados.ciudadano
     JOIN areas ON areas.id_area = empleados.jefe_area
  WHERE 
    NOT 
        empleados.eliminado 
    AND 
        NOT areas.eliminado 
    AND 
        empleados.tipo = 'Coordinador'::tipoRol
  GROUP BY empleados.jefe_area, areas.nombre, ciudadanos.imagen
  ORDER BY areas.nombre
 LIMIT 100;
/* 
    Lista los empleados de todas las areas con sus caracteristicas que tengan un estado activado
*/
CREATE VIEW public.listarEmpleadosAreas AS
 SELECT areas.id_area AS codigo_area,
    areas.nombre,
    ciudadanos.cedula,
    ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1)) AS persona,
    ciudadanos.telefono,
    ciudadanos.discapacidad,
    ciudadanos.enfermedad
   FROM ((public.empleados
     JOIN public.ciudadanos ciudadanos ON ((ciudadanos.id_ciudadano = empleados.ciudadano)))
     JOIN public.areas ON ((areas.id_area = empleados.area)))
  WHERE (empleados.jefe_area IS NULL)
  ORDER BY ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1));