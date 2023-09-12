create function CreateLaboratory (nameLaboratory varchar(50)) 
    returns table (
        id integer,
        message varchar(50)
    )  language plpgsql
as $$
    declare idSuccessfulRespose = 200;
    declare messageSuccessfulRespose = "Se ha creado correctamente el laboratorio: "||nameLaboratory;
     
    declare idFailRespose = 500;
    declare messageFailRespose = "Este la boratorio ya existe: "||nameLaboratory;
    
    declare idLaboratory integer default null;
begin 

    idLaboratory = existLaboratory(nameLaboratory);

    if idLaboratory is null then
        insert into Laboratories (laboraty) values (nameLaboratory);
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

    

and;
$$;
