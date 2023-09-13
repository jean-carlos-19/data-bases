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