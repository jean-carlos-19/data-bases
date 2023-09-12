create table if not exists vocabularies(
    idVocabulary integer primary key AUTOINCREMENT,
    name text not null,
    translation text not null,
    isActivate boolean default true
);