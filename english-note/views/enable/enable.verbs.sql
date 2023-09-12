create view if not exists showAllEnableVerbs as
select idVerb, simplePresent, simplePast,  presentTranslation, pastTranslation, examples from verbs where isActivate = 1; 