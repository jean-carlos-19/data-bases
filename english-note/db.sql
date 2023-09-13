/*  */
create table if not exists categories(
    idCategory integer primary key AUTOINCREMENT,
    name varchar(50) not null,
    isActivate boolean default true
);
/*  */
 create table if not exists  verbs (
    idVerb integer primary key AUTOINCREMENT,
    simplePresent varchar(50) not null,
    simplePast varchar(50) not null,
    presentTranslation text not null,
    pastTranslation text not null,
    examples text not null,
    isActivate boolean default true
);
/*  */
create table if not exists vocabularies(
    idVocabulary integer primary key AUTOINCREMENT,
    category varchar(50) not null,
    name text not null,
    translation text not null,
    isActivate boolean default true
);
/*  */
create table if not exists phrasalVerbs (
    idPhrasalVerb integer primary key autoincrement,
    name varchar(50) not null unique,
    translation varchar(50) not null,
    examples text not null,
    isActivate boolean default true
);
/* */
create table if not exists idioms(
    idIdioms integer primary key autoincrement,
    name varchar(50) not null,
    tranlation varchar(50) not null,
    exmaples text not null,
    isActivate boolean default true
);
/*  */
create table if not exists histories(
    idHistory integer not null,
    title varchar(50) not null,
    content text not null,
    translation text not null,
    isActivate boolean default true
);

create view if not exists showAllEnableCategories as
select idCategory, lower(name) as name
from categories 
where isActivate = 1
order by name; 

create view if not exists showAllEnableVerbs as
select 
    idVerb, 
    lower(simplePresent) as simplePresent, 
    lower(simplePast) as simplePast,  
    lower(presentTranslation) as presentTranslation, 
    lower(pastTranslation) as pastTranslation, 
    lower(examples) as examples
from verbs 
where isActivate = 1
order by simplePresent; 

create view if not exists showAllEnableVocabularies as
select 
    idVocabulary,
    lower(category) as category, 
    lower(name) as name, 
    lower(translation) as translation 
from vocabularies 
where isActivate = 1
order by name; 


create view if not exists showAllDisableCategories as
select 
    idCategory, 
   lower(name) as name
from categories 
where not not isActivate
order by name; 


create view if not exists showAllDisableVocabularies as
select 
    idVocabulary,
    lower(category) as category, 
    lower(name) as name, 
    lower(translation) as translation 
from vocabularies 
where not isActivate
order by name; 


create view if not exists showAllDisableVerbs as
select 
    idVerb, 
    lower(simplePresent) as simplePresent, 
    lower(simplePast) as simplePast,  
    lower(presentTranslation) as presentTranslation, 
    lower(pastTranslation) as pastTranslation, 
    lower(examples) as examples
from verbs 
where not isActivate
order by  simplePresent; 