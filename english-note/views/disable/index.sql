/*  */
create view if not exists showAllDisableVerbs as
select idVerb, simplePresent, simplePast, presentTranslation, pastTranslation, examples 
from verbs 
where not isActivate; 
/*  */
create view if not exists showAllDisableVocabularies as
select idVocabulary, name, translation 
from vocabularies 
where not isActivate; 

/*  */
create view if not exists showAllDisableCategories as
select idCategory, name 
from categories 
where not not isActivate; 