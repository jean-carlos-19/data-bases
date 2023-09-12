create table if not exists phrasalVerbs (
    idPhrasalVerb integer primary key autoincrement,
    name varchar(50) not null unique,
    translation varchar(50) not null,
    examples text not null,
    isActivate boolean default true
)