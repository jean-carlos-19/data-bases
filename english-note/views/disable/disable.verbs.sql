create view if not exists showAllDisableVerbs as
select idVerb, simplePresent, simplePast, presentTranslation, pastTranslation, examples from verbs where not isActivate; 