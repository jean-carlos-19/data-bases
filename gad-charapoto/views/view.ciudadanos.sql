CREATE VIEW listarCiudadanos AS
 SELECT 
    comunidades.nombre AS "comunidad",
    ciudadanos.cedula as "Cedula",
    split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1 AS "Nombres",
    ciudadanos.telefono as "Telefono",
    ciudadanos.discapacidad as "Discapcidad",
    ciudadanos.enfermedad as "Enfermedad",
    age((CURRENT_DATE)::timestamp with time zone, (ciudadanos.fecha_nacimiento)::timestamp with time zone) AS "Edad",
    ciudadanos.imagen as "Imagen"
   FROM ciudadanos
     JOIN comunidades ON comunidades.id_comunidad = ciudadanos.comunidad
  WHERE ciudadanos.eliminado = false
  ORDER BY ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1))
 LIMIT 100;