create function existLaboratory (nameLaboratory varchar(50)) 
    returns integer  language plpgsql
as $$
    declare targetLaboratory integer default null;
begin 
    select  idLaboratory into targetLaboratory from showAllEnableLaboratories where laboraty = nameLaboratory;
    return targetLaboratory;
and;
$$;