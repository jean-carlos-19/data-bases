create function existLaboratoryId (targetIdLaboratory integer) 
    returns integer  language plpgsql
as $$
    declare targetLaboratory varchar(50) default null;
begin 
    select  laboratory into targetLaboratory from showAllEnableLaboratories where idLaboratory = targetIdLaboratory;
    return targetLaboratory;
and;
$$;