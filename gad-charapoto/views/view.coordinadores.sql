CREATE VIEW public.listarCoordinadores AS
 SELECT 
    ciudadanos.cedula as "Cedula",
    ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1)) AS "Nombres",
    age((CURRENT_DATE)::timestamp with time zone, (ciudadanos.fecha_nacimiento)::timestamp with time zone) AS "Edad",
    ciudadanos.telefono as "Telefono",
    ciudadanos.usuario as "Usuario"
   FROM ((public.empleados
     JOIN public.ciudadanos ON ((ciudadanos.id_ciudadano = empleados.ciudadano)))
     JOIN public.areas ON ((areas.id_area = empleados.jefe_area)))
  WHERE ((NOT empleados.eliminado) AND (empleados.tipo = 'Coordinador'::public.tipo_rol))
  ORDER BY ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1))
 LIMIT 100;