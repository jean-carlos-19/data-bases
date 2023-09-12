create view showAllDisableProducts as
select 
    idLaboraty, 
    idLaboratory,
    barCode, 
    existLaboratoryId(idLaboratory) as laboratory, 
    initcap(product) as product, 
    initcap(features) as features, 
    initcap(summary) as summary, 
    initcap(dosage) as dosage, 
    initcap(photo) as photo 
from Product 
where not isActivate;