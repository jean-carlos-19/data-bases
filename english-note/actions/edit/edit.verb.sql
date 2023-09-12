/* 
update verbs set 
    simplePresent = ?, 
    simplePast = ?, 
    presentTranslation = ?, 
    pastTranslation = ?, 
    examples = ? 
    where idVerb = ?;
 */
update showAllEnableVerbs 
set 
    simplePresent ='fix', 
    simplePast='', 
    presentTranslation='', 
    pastTranslation='', 
    translation= 'reparar', 
    examples='you fix the car' 
where idVerb = 1;