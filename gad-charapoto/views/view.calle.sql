CREATE VIEW public.mostarCalle AS
SELECT 
   calles.nombre as "Nombre",
   calles.tipo as "Tipo"
FROM public.calles
WHERE (calles.activo = true)
ORDER BY calles.nombre
LIMIT 100;