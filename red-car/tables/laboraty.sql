create table Laboratory {
    idLaboraty integer not null,
    laboraty varchar(50) unique not null,
    isActivate boolean default true
}