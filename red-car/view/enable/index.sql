/*  */
create view showAllEnableProducts as
select 
    idLaboratory, 
    idLaboratory, 
    initcap(product), 
    initcap(features), 
    initcap(summary), 
    initcap(dosage), 
    initcap(photo) 
from Products
where  isActivate = true;

/*  */
create view showAllEnableLaboratories as
select 
    idLaboraty, 
    initcap(laboratory) 
from Laboratory 
where isActivate = true;