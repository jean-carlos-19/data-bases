create view showAllEnableLaboratory as
select idLaboraty, laboraty from Laboratory where isActivate = true;