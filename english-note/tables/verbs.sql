 create table if not exists  verbs (
    idVerb integer primary key AUTOINCREMENT,
    simplePresent varchar(50) not null,
    simplePast varchar(50) not null,
    presentTranslation text not null,
    pastTranslation text not null,
    examples text not null,
    isActivate boolean default true
);