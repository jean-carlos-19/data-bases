create view if not exists showAllEnableVocabularies as
select 
    idVocabulary,
    lower(category) as category, 
    lower(name) as name, 
    lower(translation) as translation 
from vocabularies 
where isActivate = 1
order by name; 