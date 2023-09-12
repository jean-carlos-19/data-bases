create view showAllEnableLaboratories as
select 
    idLaboraty, 
    initcap(laboratory) 
from Laboratory 
where isActivate = true;