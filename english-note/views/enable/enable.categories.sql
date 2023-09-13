create view if not exists showAllEnableCategories as
select idCategory, lower(name) as name
from categories 
where isActivate = 1
order by name; 