
CREATE TABLE public.comunidades (
    idComunidad integer NOT NULL,
    nombre character varying(25) NOT NULL,
    activo boolean DEFAULT true NOT NULL
);