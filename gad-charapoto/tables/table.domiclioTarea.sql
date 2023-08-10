CREATE TABLE public.domiciliosTareas (
    id_domicilio_tarea integer NOT NULL,
    id_ciudadano integer NOT NULL,
    id_tarea integer NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    constraint id_domcilioTarea_ciudadano 
        foreign key (id_empleado) references ciudadanos(id_ciudadano)
        on delete no action on update cascade,
    constraint id_domicilioTarea_tarea 
        foreign key (id_ciudadano) references tareas(id_tarea)
        on delete no action on update cascade
);