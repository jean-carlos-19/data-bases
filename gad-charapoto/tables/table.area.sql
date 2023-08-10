CREATE TABLE areas (
    id_area integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(255),
    fecha_creacion date NOT NULL,
    activo boolean DEFAULT true NOT NULL
);