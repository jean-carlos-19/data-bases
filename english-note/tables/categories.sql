create table if not exists categories(
    idCategory integer primary key AUTOINCREMENT,
    name varchar(50) not null,
    isActivate boolean default true
);