CREATE VIEW listarDomicilios AS
 SELECT 
    domicilios.id_domicilio AS "id_domicilio",
    ciudadanos.id_ciudadano as "id_ciudadano",
    ciudadanos.cedula as "Cedula",
    ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1)) AS "Nombres",
    total_ciudadanos_domicilios(ciudadanos.cedula) AS "Nº Personas",
    total_enfermos_domicilio(ciudadanos.cedula) AS "Nª Enfermos",
    total_discapacidad_domicilio(ciudadanos.cedula) AS "Nª Discapacitados"
   FROM ((ciudadanos
     JOIN comunidades ON ((comunidades.id_comunidad = ciudadanos.comunidad)))
     JOIN domicilios ON ((domicilios.id_domicilio = ciudadanos.jefe)))
  ORDER BY ((split_part((ciudadanos.nombres)::text, ' '::text, 1) || ' '::text) || split_part((ciudadanos.apellidos)::text, ' '::text, 1))
 LIMIT 100;
