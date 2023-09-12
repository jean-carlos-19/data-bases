/* view disable */

create view showAllDisableLaboratories as
select initcap(idLaboraty), initcap(laboraty) 
from Laboratory 
where not isActivate;

create view showAllDisableProducts as
select 
    idLaboraty, 
    idLaboratory,
    barCode, 
    initcap(product), 
    initcap(features), 
    initcap(summary), 
    initcap(dosage), 
    initcap(photo) 
from Product 
where not isActivate;

/* View enable */
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

create view showAllEnableLaboratories as
select 
    idLaboraty, 
    initcap(laboratory) 
from Laboratory 
where isActivate = true;