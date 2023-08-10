CREATE VIEW public.listarCantones AS
SELECT 
    provincias.nombre AS "Provincia",
    cantones.nombre AS "Canton"
FROM cantones
    JOIN public.provincias ON provincias.id_provincia = cantones.id_provincia
ORDER BY provincias.nombre;
