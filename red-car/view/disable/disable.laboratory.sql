create view showAllDisableLaboratories as
select idLaboratory, initcap(laboratory) 
from Laboratories 
where not isActivate;