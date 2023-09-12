create table Laboratory {
    idLaboraty integer not null,
    laboraty varchar(50) unique not null,
    isActivate boolean default true
}
create table Product (
    idProduct integer not null,
    idLaboratory integer not null,
    product varchar(50) not null,
    features text not null,
    summary text not null,
    dosage text not null,
    photo text,
    isActivate boolean not null default true,
    foreign key (idLaboratory) references Laboratory(idLaboratory)
    on delete no action on update cascade 
)

/* views enable */

create view showAllEnableProduct as
select idLaboraty, idLaboratory, product, features, summary, dosage, photo from Product where  isActivate = true;

create view showAllEnableLaboratory as
select idLaboraty, laboraty from Laboratory where isActivate = true;


/* view disable */

create view showAllDisableLaboratory as
select idLaboraty, laboraty from Laboratory where not isActivate;

create view showAllDisableProduct as
select idLaboraty, idLaboratory, product, features, summary, dosage, photo from Product where not isActivate;

/* functions verify */
create function verifyLaboratory (nameLaboratory varchar(50)) 
    return integer;
as $$
    declare targetLaboratory integer default null;
begin 
    select  idLaboratory into targetLaboratory from Laboratory where laboraty = nameLaboratory;
    return targetLaboratory;
and;
$$;

/* functions create  */

create function CreateLaboratory (nameLaboratory varchar(50)) 
    return table (
        id integer,
        message varchar(50)
    );
as $$
    declare idSuccessfulRespose = 200;
    declare messageSuccessfulRespose = "Se ha creado correctamente el laboratorio: "||nameLaboratory;
     
    declare idFailRespose = 500;
    declare messageFailRespose = "Este la boratorio ya existe: "||nameLaboratory;
    
    declare idLaboratory integer default null;
begin 

    idLaboratory = existLaboratory(nameLaboratory);

    if idLaboratory is null then
        insert into Laboratory (laboraty) values (nameLaboratory);
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
    return table(
        id integer,
        message varchar(50)
    );
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