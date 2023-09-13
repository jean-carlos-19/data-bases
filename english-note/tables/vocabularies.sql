create table if not exists vocabularies(
    idVocabulary integer primary key AUTOINCREMENT,
    category varchar(50) not null,
    name text not null,
    translation text not null,
    isActivate boolean default true
);