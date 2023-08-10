CREATE VIEW mostrar_empleados AS
 SELECT 
    ciudadanos.cedula as "Cedula",
    ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1)) AS "Nombres",
    age((CURRENT_DATE)::timestamp with time zone, (ciudadanos.fecha_nacimiento)::timestamp with time zone) AS "Edad",
    ciudadanos.telefono as "Telefono",
    ciudadanos.usuario as "Usuario",
    ciudadanos.imagen as "Imagen "
   FROM (empleados
     JOIN ciudadanos ON ((ciudadanos.id_ciudadano = empleados.ciudadano)))
  WHERE ((NOT empleados.eliminado) AND (empleados.tipo = 'Empleado'::tipoRol) AND (NOT (empleados.area IS NULL)))
  ORDER BY "Nombres"
 LIMIT 100;