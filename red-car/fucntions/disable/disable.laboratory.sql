create function if not exists DisableLaboratory(nameLaboratory varchar(50)) 
    returns table(
        id integer,
        message varchar(50)
    ) language plpgsql
as$$
    declare idSuccessfulRespose = 200;
    declare messageSuccessfulRespose = "Se ha desabilitado correctamente el laboratorio: "||nameLaboratory;
    declare id_laboratory integer default null;
begin
    id_laboratory = existLaboratory(nameLaboratory);
    
    if not (id_laboratory is null) then
        update Laboratories set isActivate = false where idLaboratory = id_laboratory;
        return query (
            idSuccessfulRespose,
            messageSuccessfulRespose
        );
    else 
        return query (
            idFailRespose,
            messageFailRespose
        );
    end if;
end;
$$;