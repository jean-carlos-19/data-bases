/*  */
create table Laboratories (
    idLaboratory serial primary key,
    laboratory varchar(50) unique not null,
    isActivate boolean default true
);
/*  */
create table Products (
    idProduct serial primary key,
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