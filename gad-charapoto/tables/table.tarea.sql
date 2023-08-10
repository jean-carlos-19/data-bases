CREATE TABLE public.tareas (
    id_tarea integer NOT NULL,
    id_coordinador integer NOT NULL,
    id_area integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(255) NOT NULL,
    fecha_inicial date NOT NULL,
    tiempo_inicial time without time zone NOT NULL,
    tiempo_final time without time zone NOT NULL,
    estado public.tipo_tarea NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    eliminado boolean DEFAULT false NOT NULL,
    comunidad integer,
    constraint id_tarea_coordinador 
        foreign key id_coordinador references empleados(id_empleado)
        on delete no action on update cascade,
    constraint id_tarea_area 
        foreign key id_area references areas(id_area)
        on delete no action on update cascade
);