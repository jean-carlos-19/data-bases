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