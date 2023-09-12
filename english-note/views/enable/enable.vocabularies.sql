create view if not exists showAllEnableVocabularies as
select idVocabulary, name, translation from vocabularies where isActivate = 1; 