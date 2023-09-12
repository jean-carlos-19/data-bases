create view if not exists showAllDisableCategories as
select idCategory, name from categories where not not isActivate; 