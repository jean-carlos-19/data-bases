CREATE TABLE public.calles (
    id_calle integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo public.tipoCalle NOT NULL,
    activo boolean DEFAULT true NOT NULL,
);
