create table Laboratories (
    idLaboratory integer not null,
    laboratory varchar(50) unique not null,
    isActivate boolean default true
);