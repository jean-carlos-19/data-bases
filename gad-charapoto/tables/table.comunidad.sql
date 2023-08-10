
CREATE TABLE public.comunidades (
    id_comunidad integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean DEFAULT true NOT NULL
);