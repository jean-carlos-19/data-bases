create function if not exists DisableProduct (targetIdProducto integer)
returns table(
    id integer,
    message varchar(50)
)  language plpgsql
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