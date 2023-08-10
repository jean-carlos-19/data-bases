CREATE TABLE public.empleadosTareas (
    id_empleado_tarea integer NOT NULL,
    id_empleado integer NOT NULL,
    id_tarea integer NOT NULL,
    fotos text,
    descripcion text,
    materiales text,
    constraint id_empleadoTarea_empleado
        foreign key id_empleado references empleados(id_empleado)
        on delete no action on update cascade,
    constraint id_empleadoTarea_tarea 
        foreign key id_tarea references tareas(id_tarea),
        on delete no action on update cascade,
);