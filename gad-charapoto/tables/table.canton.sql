CREATE TABLE public.cantones (
    id_canton integer NOT NULL,
    id_provincia integer not null,
    nombre character varying(50),
    constraint id_canton_provincia 
        foreign key (id_provincia) references provincias(id_provincia)
        on delete no action on update cascade,
);