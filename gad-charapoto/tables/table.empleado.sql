CREATE TABLE public.empleados (
    id_empleado integer NOT NULL,
    id_area integer,
    jefe_area integer,
    id_ciudadano integer NOT NULL,
    tipo public.tipoRol NOT NULL,
    profesion character varying(50) NOT NULL,
    sueldo real not null,
    activo boolean DEFAULT true NOT NULL,
    constraint id_empleado_area 
        foreign key id_area references areas(id_area)
        on delete no action on update cascade,

    constraint id_empleado_ciudadano 
        foreign key id_ciudadano references ciudadanos(id_ciudadano) 
        on delete no action on update cascade,
);