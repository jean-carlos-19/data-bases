create view if not exists showAllDisableVocabularies as
select idVocabulary, name, translation from vocabularies where not isActivate; 
