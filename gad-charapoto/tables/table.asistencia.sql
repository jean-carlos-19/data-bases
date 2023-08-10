CREATE TABLE public.asistencias (
    id_asistecia integer NOT NULL,
    id_empleado integer NOT NULL,
    id_area integer NOT NULL,
    hora_inicial time without time zone,
    hora_final time without time zone,
    fecha date,
    activo boolean DEFAULT true NOT NULL
    constraint id_asistencia_empleado 
        foreign key (id_empleado) references empleados(id_empleado)
        on delete no action on update cascade,

    constraint id_asistencia_area 
        foreign key (id_area) references areas(id_area)
        on delete no action on update cascade
);
