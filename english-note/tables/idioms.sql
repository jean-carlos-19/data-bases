create table if not exists idioms(
    idIdioms integer primary key autoincrement,
    name varchar(50) not null,
    tranlation varchar(50) not null,
    exmaples text not null,
    isActivate boolean default true
)