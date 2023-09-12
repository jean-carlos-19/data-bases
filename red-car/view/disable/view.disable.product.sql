create view showAllDisableProduct as
select idLaboraty, idLaboratory, product, features, summary, dosage, photo from Product where not isActivate;