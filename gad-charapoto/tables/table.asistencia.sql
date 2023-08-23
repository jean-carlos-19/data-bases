CREATE TABLE public.asistencias (
    idAsistecia integer NOT NULL,
    idEmpleado integer NOT NULL,
    idArea integer NOT NULL,
    horaInicial time without time zone,
    horaFinal time without time zone,
    fecha date,
    activo boolean DEFAULT true NOT NULL
    constraint id_asistencia_empleado 
        foreign key (idEmpleado) references empleados(idEmpleado)
        on delete no action on update cascade,

    constraint id_asistencia_area 
        foreign key (idArea) references areas(idArea)
        on delete no action on update cascade
);
