CREATE VIEW public.listarCuentas AS
 SELECT 
    ciudadanos.id_ciudadano as "id_ciudadano",
    ciudadanos.cedula as "Cedula",
    ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1)) AS "Nombres",
    empleados.tipo AS "Rol",
    ciudadanos.correo as "Correo",
    ciudadanos.usuario as "Usurio",
    ciudadanos.contrasena as "Password"
   FROM (public.empleados
     JOIN public.ciudadanos ON ((ciudadanos.id_ciudadano = empleados.ciudadano)))
  WHERE ((NOT (ciudadanos.usuario IS NULL)) AND (NOT (ciudadanos.contrasena IS NULL)) AND (NOT empleados.eliminado))
  ORDER BY ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1))
 LIMIT 100;