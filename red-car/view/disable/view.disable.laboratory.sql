create view showAllDisableLaboratory as
select idLaboraty, laboraty from Laboratory where not isActivate;