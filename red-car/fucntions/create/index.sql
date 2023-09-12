/*  */
create function CreateLaboratory (nameLaboratory varchar(50)) 
    returns table (
        id integer,
        message varchar(50)
    ) language plpgsql
as $$
    declare idSuccessfulRespose = 200;
    declare messageSuccessfulRespose = "Se ha creado correctamente el laboratorio: "||nameLaboratory;
     
    declare idFailRespose = 500;
    declare messageFailRespose = "Este la boratorio ya existe: "||nameLaboratory;
    
    declare idLaboratory integer default null;
begin 

    idLaboratory = existLaboratory(nameLaboratory);

    if idLaboratory is null then
        insert into Laboratory (laboratory) values (nameLaboratory);
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

/*  */
create function CreateProduct (
    nameLaboratory varchar(50),
    nameProduct varchar(50),
    featuresProduct text,
    summaryProduct text,
    dosageProduct text,
    photoProduct text
)
    returns table(
        id integer,
        message varchar(50)
    ) language plpgsql
as $$
    declare idSuccessfulRespose = 200;
    declare messageSuccessfulRespose = "Se ha creado correctamente el producto: "||nameLaboratory;

        declare idFailRespose = 500;
    declare messageFailRespose = "Este laboratorio no existe: "||nameLaboratory;

    declare id_laboratory integer default null;
begin 

    id_laboratory = existLaboratory(nameLaboratory);

    if not (id_laboratory is null) then
        insert into Prodcut (idLaboratory, product, features, summary, dosage, photo) values(id_laboratory, nameProduct,featuresProduct,summaryProduct,dosageProduct,photoProduct);
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