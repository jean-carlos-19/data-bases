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
$$

/**/
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