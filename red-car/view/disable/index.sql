/*  */
create view showAllDisableLaboratories as
select initcap(idLaboraty), initcap(laboraty) 
from Laboratory 
where not isActivate;

/*  */
create view showAllEnableProducts as
select 
    idLaboratory, 
    idLaboratory,
    existLaboratoryId(idLaboratory), 
    initcap(product), 
    initcap(features), 
    initcap(summary), 
    initcap(dosage), 
    initcap(photo) 
from Products
where  isActivate = true;