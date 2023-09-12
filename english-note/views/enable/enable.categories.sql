create view if not exists showAllEnableCategories as
select idCategory, name from categories where not isActivate = 1; 