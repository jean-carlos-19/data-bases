create view if not exists showAllDisableVocabularies as
select 
    idVocabulary,
    lower(category) as category, 
    lower(name) as name, 
    lower(translation) as translation 
from vocabularies 
where not isActivate
order by name; 