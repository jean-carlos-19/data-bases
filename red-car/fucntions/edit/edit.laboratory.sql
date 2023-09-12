create function if not exists EditLagoratory(
    targetIdLaboratory integer,
    nameLaboratory varchar(50)
) 
    returns table(
        id integer, 
        message varchar(50)
    )   language plpgsql
as $$
    declare idSuccessfulRespose = 200;
    declare messageSuccessfulRespose = "Se ha modificado correctamente el laboratorio: "||nameLaboratory;
begin

    update Laboratories set laboratory = nameLaboratory where idLaboratory = targetIdLaboratory;

    return query(
        idSuccessfulRespose,
        messageSuccessfulRespose
    ); 

end;
$$;