CREATE TABLE areas (
    idArea integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(255),
    fechaCreacion date NOT NULL,
    activo boolean DEFAULT true NOT NULL
);