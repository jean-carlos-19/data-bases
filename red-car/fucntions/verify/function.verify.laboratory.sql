create function existLaboratory (nameLaboratory varchar(50)) 
    return integer;
as $$
    declare targetLaboratory integer default null;
begin 
    select  idLaboratory into targetLaboratory from showAllEnableLaboratory where laboraty = nameLaboratory;
    return targetLaboratory;
and;
$$;