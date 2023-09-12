create view showAllEnableProducts as
select 
    idLaboratory, 
    idLaboratory,
    barCode,
    existLaboratoryId(idLaboratory) as laboratory, 
    initcap(product) as product, 
    initcap(features) as features, 
    initcap(summary) as summary, 
    initcap(dosage) as dosage, 
    initcap(photo) as photo 
from Products
where  isActivate = true;