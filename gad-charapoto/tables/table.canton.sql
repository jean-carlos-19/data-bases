CREATE TABLE public.cantones (
    idCanton integer NOT NULL,
    idProvincia integer not null,
    nombre character varying(50),
    constraint id_canton_provincia 
        foreign key (id_provincia) references provincias(id_provincia)
        on delete no action on update cascade,
);