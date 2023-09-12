create table Products (
    idProduct integer not null,
    idLaboratory integer not null,
    barCode char(12) not null,
    product varchar(50) not null,
    features text not null,
    summary text not null,
    dosage text not null,
    photo text,
    isActivate boolean not null default true,
    foreign key (idLaboratory) references Laboratory(idLaboratory)
    on delete no action on update cascade 
);