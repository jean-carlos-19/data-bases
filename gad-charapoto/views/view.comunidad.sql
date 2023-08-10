CREATE VIEW public.listarComunidades AS
 SELECT comunidades.nombre AS Nombre,
    count(ciudadanos.jefe) AS Domicilio,
    count(ciudadanos.cedula) AS Integrantes,
    count(ciudadanos.enfermedad) AS Enfermos,
    count(ciudadanos.discapacidad) AS Discapacitados
   FROM ciudadanos
     JOIN comunidades ON comunidades.id_comunidad = ciudadanos.comunidad
  GROUP BY comunidades.nombre
  ORDER BY comunidades.nombre
 LIMIT 100;

CREATE VIEW public.listarComunidades AS
SELECT 
    comunidades.id_comunidad as "id:comunidad",
    comunidades.nombre, as "Nombre"
FROM public.comunidades
WHERE (comunidades.eliminado = false)
ORDER BY comunidades.nombre
LIMIT 100;