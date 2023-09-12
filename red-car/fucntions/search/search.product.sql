create function if not exists SearchProduct(
    targetNameProduct varchar(50),
    targetNameLaboratory varchar(50)
) 
    returns table (
            idLaboratory integer,
            barCode char(12),
            laboratory varchar(50),
            product varchar(50),
            features text,
            summary text,
            dosage text,
            photo text
    ) language plpgsql
as $$
begin 
    return query(
        select  
            idLaboratory,
            laboratory,
            barCode,
            product,
            features,
            summary,
            dosage,
            photo
        from showAllEnableProducts 
        where 
            INITCAP(product) like '%'||INITCAP(targetNameProduct) 
        or 
            laboratory = targetNameLaboratory;
    );
end; 
$$;