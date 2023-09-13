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