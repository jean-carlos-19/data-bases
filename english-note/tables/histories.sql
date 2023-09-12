create table if not exists histories(
    idHistory integer not null,
    title varchar(50) not null,
    content text not null,
    translation text not null,
    isActivate boolean default false
)