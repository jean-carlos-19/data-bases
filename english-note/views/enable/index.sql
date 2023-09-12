/*  */
create view if not exists showAllEnableCategories as
select idCategory, name from categories where not isActivate = 1; 

/*  */

create view if not exists showAllEnableVerbs as
select idVerb, name, translation, examples from verbs where isActivate = 1; 

/*  */
create view if not exists showAllEnableVocabularies as
select idVocabulary, name, translation from vocabularies where isActivate = 1; 