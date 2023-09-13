create view if not exists showAllDisableCategories as
select 
    idCategory, 
   lower(name) as name
from categories 
where not not isActivate
order by name; 