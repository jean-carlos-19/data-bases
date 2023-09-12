create view showAllEnableProduct as
select idLaboraty, idLaboratory, product, features, summary, dosage, photo from Product where  isActivate = true;