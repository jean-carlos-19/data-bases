/* exists */
create function existLaboratory (nameLaboratory varchar(50)) 
    returns integer  language plpgsql
as $$
    declare targetLaboratory integer default null;
begin 
    select  idLaboratory into targetLaboratory from showAllEnableLaboratories where laboratory = nameLaboratory;
    return targetLaboratory;
and;
$$;

/* create */
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

/* Disable */
create function if not exists DisableProduct (targetIdProducto integer)
returns table(
    id integer,
    message varchar(50)
) language plpgsql
as $$
    declare idSuccessfulRespose = 200;
    declare messageSuccessfulRespose = "Se ha desabilitado correctamente el producto: "||nameLaboratory;
begin

    update Products set isActivate = false where idProduct = targetIdProducto;
    return query(
        idSuccessfulRespose,
        messageSuccessfulRespose
    );
end;
$$;

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

/* Edit */
create function if not exists EditProduct (
    targetIdProduct integer,
    nameLaboratory varchar(50),
    nameProduct varchar(50),
    barCodeProduct char(12),
    featuresProduct text,
    summaryProduct text,
    dosageProduct text,
    photoProduct text
)
return table(
    id integer,
    message varchar(50)
)language plpgsql
as $$
   declare idSuccessfulRespose = 200;
   declare messageSuccessfulRespose = "Se ha modificado correctamente el producto: "||nameProduct;
   
    declare idFailRespose = 500;
    declare messageFailRespose = "Este laboratorio no existe: "||nameLaboratory;


   declare targetIdLaboratory integer default null;
begin 
    targetIdLaboratory = existLaboratory(nameLaboratory);

    if not (id_laboratory is null) then
        update Products set
            idLaboratory = targetIdLaboratory,
            barCode = barCodeProduct,
            product = nameLaboratory,
            features = featuresProduct,
            summary = summaryProduct,
            dosage = dosageProduct,
            photo = photoProduct
        where idProduct = targetIdProduct;
        return query(
            idSuccessfulRespose,
            messageSuccessfulRespose
        );
    else 
        return query(
            idFailRespose,
            messageFailRespose
        );
    end if;
end; 
$$;

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

/* search */
