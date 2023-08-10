CREATE TABLE public.domicilios (
    id_domicilio integer NOT NULL,
    calle integer NOT NULL,
    referencia character varying(255) NOT NULL,
    imagen text,
    longitud numeric,
    latitud numeric
    activo boolean DEFAULT true NOT NULL,
);