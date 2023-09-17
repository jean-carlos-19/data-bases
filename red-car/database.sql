--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.0 (Ubuntu 16.0-1.pgdg22.04+1)

-- Started on 2023-09-16 21:19:31 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 18628)
-- Name: create_category(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_category(namecategory character varying) RETURNS TABLE(id integer, message text)
    LANGUAGE plpgsql
    AS $$
    declare idCategory integer default null;
begin 

    idCategory = exist_category(nameCategory);

    if idCategory is null then
        insert into categories (category) values (nameCategory);
        return query (select 
            200,
            'Se ha creado correctamente la categoria: '||nameCategory
        );
    else 
        return query( select 500, 'Esta categoria ya existe: '||nameCategory );
    end if;
end;
$$;


ALTER FUNCTION public.create_category(namecategory character varying) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 18609)
-- Name: create_laboratory(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_laboratory(namelaboratory character varying) RETURNS TABLE(id integer, message text)
    LANGUAGE plpgsql
    AS $$
    declare idLaboratory integer default null;
begin 

    idLaboratory = exist_laboratory(nameLaboratory);

    if idLaboratory is null then
        insert into Laboratories (laboratory) values (nameLaboratory);
        return query (select 
            200,
            'Se ha creado correctamente el laboratorio: '||nameLaboratory
        );
    else 
        return query( select 500, 'Este la boratorio ya existe: '||nameLaboratory );
    end if;
end;
$$;


ALTER FUNCTION public.create_laboratory(namelaboratory character varying) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 18631)
-- Name: disable_category(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.disable_category(namecategory character varying) RETURNS TABLE(id integer, message text)
    LANGUAGE plpgsql
    AS $$
    declare idSuccessfulRespose integer;
    declare messageSuccessfulRespose text;

     declare idFailRespose integer;
    declare messageFailRespose text;
    
    declare targetIdCategory integer default null;
begin
    idSuccessfulRespose = 200;
    messageSuccessfulRespose = 'Se ha desabilitado correctamente la categoria: '||nameCategory;

    idSuccessfulRespose = 500;
    messageFailRespose = 'La categoria ya existe: '||nameCategory;

    targetIdCategory = exist_enable_category(nameCategory);
    
    if not (targetIdCategory is null) then
        update categories set isActivate = false where idCategory = targetIdCategory;
        return query (
            select idSuccessfulRespose, messageSuccessfulRespose
        );
    else 
        return query (
            select idFailRespose, messageFailRespose
        );
    end if;
end;
$$;


ALTER FUNCTION public.disable_category(namecategory character varying) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 18617)
-- Name: disable_laboratory(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.disable_laboratory(namelaboratory character varying) RETURNS TABLE(id integer, message text)
    LANGUAGE plpgsql
    AS $$
    declare idSuccessfulRespose integer;
    declare messageSuccessfulRespose text;

     declare idFailRespose integer;
    declare messageFailRespose text;
    
    declare id_laboratory integer default null;
begin
    idSuccessfulRespose = 200;
    messageSuccessfulRespose = 'Se ha desabilitado correctamente el laboratorio: '||nameLaboratory;

    idSuccessfulRespose = 500;
    messageFailRespose = 'El laboratorio ya existe: '||nameLaboratory;

    id_laboratory = exist_enable_laboratory(nameLaboratory);
    
    if not (id_laboratory is null) then
        update Laboratories set isActivate = false where idLaboratory = id_laboratory;
        return query (
            select idSuccessfulRespose, messageSuccessfulRespose
        );
    else 
        return query (
            select idFailRespose, messageFailRespose
        );
    end if;
end;
$$;


ALTER FUNCTION public.disable_laboratory(namelaboratory character varying) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 18629)
-- Name: edit_cagoratory(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.edit_cagoratory(targetidcategory integer, namecategory character varying) RETURNS TABLE(id integer, message text)
    LANGUAGE plpgsql
    AS $$
    declare idSuccessfulRespose integer;
    declare messageSuccessfulRespose text;
begin
    
    idSuccessfulRespose = 200;
    messageSuccessfulRespose = 'Se ha modificado correctamente la cetagoria: '||nameCategory;

    update categories 
    set category = nameCategory 
    where idCategory = targetIdCategory and isActivate = true;

    return query(
        select idSuccessfulRespose,
        messageSuccessfulRespose
    ); 

end;
$$;


ALTER FUNCTION public.edit_cagoratory(targetidcategory integer, namecategory character varying) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 18625)
-- Name: edit_laboratory(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.edit_laboratory(targetidlaboratory integer, namelaboratory character varying) RETURNS TABLE(id integer, message text)
    LANGUAGE plpgsql
    AS $$
    declare idSuccessfulRespose integer;
    declare messageSuccessfulRespose text;
begin
    
    idSuccessfulRespose = 200;
    messageSuccessfulRespose = 'Se ha modificado correctamente el laboratorio: '||nameLaboratory;

    update Laboratories 
    set laboratory = nameLaboratory 
    where idLaboratory = targetIdLaboratory and isActivate = true;

    return query(
        select idSuccessfulRespose,
        messageSuccessfulRespose
    ); 

end;
$$;


ALTER FUNCTION public.edit_laboratory(targetidlaboratory integer, namelaboratory character varying) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 18630)
-- Name: enable_category(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.enable_category(namecategory character varying) RETURNS TABLE(id integer, message text)
    LANGUAGE plpgsql
    AS $$
    declare idSuccessfulRespose integer;
    declare messageSuccessfulRespose text;

     declare idFailRespose integer;
    declare messageFailRespose text;
    
    declare targetIdCategry integer default null;
begin
    idSuccessfulRespose = 200;
    messageSuccessfulRespose = 'Se ha habilitado correctamente la categoria: '||nameCategory;

    idSuccessfulRespose = 500;
    messageFailRespose = 'La categria no existe: '||nameCategory;

    targetIdCategry = exist_disable_category(nameCategory);
    
    if not (targetIdCategry is null) then
        update Categories set isActivate = true where idCategory = targetIdCategry;
        return query (
            select idSuccessfulRespose, messageSuccessfulRespose
        );
    else 
        return query (
            select idFailRespose, messageFailRespose
        );
    end if;
end;
$$;


ALTER FUNCTION public.enable_category(namecategory character varying) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 18618)
-- Name: enable_laboratory(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.enable_laboratory(namelaboratory character varying) RETURNS TABLE(id integer, message text)
    LANGUAGE plpgsql
    AS $$
    declare idSuccessfulRespose integer;
    declare messageSuccessfulRespose text;

     declare idFailRespose integer;
    declare messageFailRespose text;
    
    declare id_laboratory integer default null;
begin
    idSuccessfulRespose = 200;
    messageSuccessfulRespose = 'Se ha habilitado correctamente el laboratorio: '||nameLaboratory;

    idSuccessfulRespose = 500;
    messageFailRespose = 'El laboratorio no existe: '||nameLaboratory;

    id_laboratory = exist_disable_laboratory(nameLaboratory);
    
    if not (id_laboratory is null) then
        update Laboratories set isActivate = true where idLaboratory = id_laboratory;
        return query (
            select idSuccessfulRespose, messageSuccessfulRespose
        );
    else 
        return query (
            select idFailRespose, messageFailRespose
        );
    end if;
end;
$$;


ALTER FUNCTION public.enable_laboratory(namelaboratory character varying) OWNER TO postgres;

--
-- TOC entry 221 (class 1255 OID 18632)
-- Name: exist_category(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exist_category(namecategory character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare targetIdCategory integer default null;
begin 
    select  idCategory 
    into targetIdCategory 
    from categories 
    where initcap(category) = initcap(nameCategory);
    return targetIdCategory;
end;
$$;


ALTER FUNCTION public.exist_category(namecategory character varying) OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 18626)
-- Name: exist_disable_category(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exist_disable_category(namecategory character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare targetIdCategory integer default null;
begin 
    select  idCategory 
    into targetIdCategory 
    from show_all_disable_categories 
    where initcap(category) = initcap(nameCategory);
    return targetIdCategory;
end;
$$;


ALTER FUNCTION public.exist_disable_category(namecategory character varying) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 18620)
-- Name: exist_disable_laboratory(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exist_disable_laboratory(namelaboratory character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare targetLaboratory integer default null;
begin 
    select  idLaboratory 
    into targetLaboratory 
    from show_all_disable_laboratories 
    where initcap(laboratory) = initcap(nameLaboratory);
    return targetLaboratory;
end;
$$;


ALTER FUNCTION public.exist_disable_laboratory(namelaboratory character varying) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 18619)
-- Name: exist_disable_laboratory_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exist_disable_laboratory_id(targetidlaboratory integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare targetLaboratory varchar(50) default null;
begin 
    select  laboratory 
	into targetLaboratory 
	from show_all_disable_laboratories 
	where idLaboratory = targetIdLaboratory;
    return targetLaboratory;
end;
$$;


ALTER FUNCTION public.exist_disable_laboratory_id(targetidlaboratory integer) OWNER TO postgres;

--
-- TOC entry 222 (class 1255 OID 18627)
-- Name: exist_enable_category(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exist_enable_category(namecategory character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare targetIdCategory integer default null;
begin 
    select  idCategory 
    into targetIdCategory 
    from show_all_enable_categories 
    where initcap(category) = initcap(nameCategory);
    return targetIdCategory;
end;
$$;


ALTER FUNCTION public.exist_enable_category(namecategory character varying) OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 18610)
-- Name: exist_enable_laboratory(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exist_enable_laboratory(namelaboratory character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare targetLaboratory integer default null;
begin 
    select  idLaboratory 
    into targetLaboratory 
    from show_all_enable_laboratories 
    where initcap(laboratory) = initcap(nameLaboratory);
    return targetLaboratory;
end;
$$;


ALTER FUNCTION public.exist_enable_laboratory(namelaboratory character varying) OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 18607)
-- Name: exist_enable_laboratory_id(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exist_enable_laboratory_id(targetidlaboratory integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare targetLaboratory varchar(50) default null;
begin 
    select  laboratory into targetLaboratory 
	from show_all_enable_laboratories 
	where idLaboratory = targetIdLaboratory;
    return targetLaboratory;
end;
$$;


ALTER FUNCTION public.exist_enable_laboratory_id(targetidlaboratory integer) OWNER TO postgres;

--
-- TOC entry 223 (class 1255 OID 18633)
-- Name: exist_laboratory(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exist_laboratory(namelaboratory character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    declare targetIdLaboratory integer default null;
begin 
    select  idLaboratory 
    into targetIdLaboratory 
    from laboratories 
    where initcap(laboratory) = initcap(nameLaboratory);
    return targetIdLaboratory;
end;
$$;


ALTER FUNCTION public.exist_laboratory(namelaboratory character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 18550)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    idcategory integer NOT NULL,
    category character varying(50) NOT NULL,
    isactivate boolean DEFAULT true
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18549)
-- Name: categories_idcategory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_idcategory_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_idcategory_seq OWNER TO postgres;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 211
-- Name: categories_idcategory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_idcategory_seq OWNED BY public.categories.idcategory;


--
-- TOC entry 210 (class 1259 OID 18525)
-- Name: laboratories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratories (
    idlaboratory integer NOT NULL,
    laboratory character varying(50) NOT NULL,
    isactivate boolean DEFAULT true
);


ALTER TABLE public.laboratories OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18524)
-- Name: laboratories_idlaboratory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laboratories_idlaboratory_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laboratories_idlaboratory_seq OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 209
-- Name: laboratories_idlaboratory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laboratories_idlaboratory_seq OWNED BY public.laboratories.idlaboratory;


--
-- TOC entry 214 (class 1259 OID 18560)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    idproduct integer NOT NULL,
    idlaboratory integer NOT NULL,
    idcategory integer NOT NULL,
    barcode character(12) NOT NULL,
    product character varying(50) NOT NULL,
    features text NOT NULL,
    summary text NOT NULL,
    dosage text NOT NULL,
    photo text,
    isactivate boolean DEFAULT true NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18559)
-- Name: products_idproduct_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_idproduct_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_idproduct_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 213
-- Name: products_idproduct_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_idproduct_seq OWNED BY public.products.idproduct;


--
-- TOC entry 216 (class 1259 OID 18583)
-- Name: show_all_disable_categories; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.show_all_disable_categories AS
 SELECT categories.idcategory,
    initcap((categories.category)::text) AS category
   FROM public.categories
  WHERE (NOT categories.isactivate);


ALTER VIEW public.show_all_disable_categories OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18587)
-- Name: show_all_disable_laboratories; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.show_all_disable_laboratories AS
 SELECT laboratories.idlaboratory,
    initcap((laboratories.laboratory)::text) AS laboratory
   FROM public.laboratories
  WHERE (NOT laboratories.isactivate);


ALTER VIEW public.show_all_disable_laboratories OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18579)
-- Name: show_all_disable_products; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.show_all_disable_products AS
 SELECT products.idproduct,
    products.idlaboratory,
    products.idcategory,
    products.barcode,
    initcap((products.product)::text) AS product,
    initcap(products.features) AS features,
    initcap(products.summary) AS summary,
    initcap(products.dosage) AS dosage,
    initcap(products.photo) AS photo
   FROM public.products
  WHERE (NOT products.isactivate);


ALTER VIEW public.show_all_disable_products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18595)
-- Name: show_all_enable_categories; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.show_all_enable_categories AS
 SELECT categories.idcategory,
    initcap((categories.category)::text) AS category
   FROM public.categories
  WHERE (categories.isactivate = true);


ALTER VIEW public.show_all_enable_categories OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18599)
-- Name: show_all_enable_laboratories; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.show_all_enable_laboratories AS
 SELECT laboratories.idlaboratory,
    initcap((laboratories.laboratory)::text) AS laboratory
   FROM public.laboratories
  WHERE (laboratories.isactivate = true);


ALTER VIEW public.show_all_enable_laboratories OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18591)
-- Name: show_all_enable_products; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.show_all_enable_products AS
 SELECT products.idproduct,
    products.idlaboratory,
    products.idcategory,
    products.barcode,
    initcap((products.product)::text) AS product,
    initcap(products.features) AS features,
    initcap(products.summary) AS summary,
    initcap(products.dosage) AS dosage,
    initcap(products.photo) AS photo
   FROM public.products
  WHERE (products.isactivate = true);


ALTER VIEW public.show_all_enable_products OWNER TO postgres;

--
-- TOC entry 3299 (class 2604 OID 18553)
-- Name: categories idcategory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN idcategory SET DEFAULT nextval('public.categories_idcategory_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 18528)
-- Name: laboratories idlaboratory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratories ALTER COLUMN idlaboratory SET DEFAULT nextval('public.laboratories_idlaboratory_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 18563)
-- Name: products idproduct; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN idproduct SET DEFAULT nextval('public.products_idproduct_seq'::regclass);


--
-- TOC entry 3463 (class 0 OID 18550)
-- Dependencies: 212
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (idcategory, category, isactivate) FROM stdin;
1	Defensas	f
2	Pronavit	t
\.


--
-- TOC entry 3461 (class 0 OID 18525)
-- Dependencies: 210
-- Data for Name: laboratories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laboratories (idlaboratory, laboratory, isactivate) FROM stdin;
2	Pronavit	t
4	pharma	f
\.


--
-- TOC entry 3465 (class 0 OID 18560)
-- Dependencies: 214
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (idproduct, idlaboratory, idcategory, barcode, product, features, summary, dosage, photo, isactivate) FROM stdin;
\.


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 211
-- Name: categories_idcategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_idcategory_seq', 3, true);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 209
-- Name: laboratories_idlaboratory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laboratories_idlaboratory_seq', 4, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 213
-- Name: products_idproduct_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_idproduct_seq', 1, false);


--
-- TOC entry 3308 (class 2606 OID 18558)
-- Name: categories categories_category_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_key UNIQUE (category);


--
-- TOC entry 3310 (class 2606 OID 18556)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (idcategory);


--
-- TOC entry 3304 (class 2606 OID 18533)
-- Name: laboratories laboratories_laboratory_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratories
    ADD CONSTRAINT laboratories_laboratory_key UNIQUE (laboratory);


--
-- TOC entry 3306 (class 2606 OID 18531)
-- Name: laboratories laboratories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratories
    ADD CONSTRAINT laboratories_pkey PRIMARY KEY (idlaboratory);


--
-- TOC entry 3312 (class 2606 OID 18568)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (idproduct);


--
-- TOC entry 3313 (class 2606 OID 18574)
-- Name: products products_idcategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_idcategory_fkey FOREIGN KEY (idcategory) REFERENCES public.categories(idcategory) ON UPDATE CASCADE;


--
-- TOC entry 3314 (class 2606 OID 18569)
-- Name: products products_idlaboratory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_idlaboratory_fkey FOREIGN KEY (idlaboratory) REFERENCES public.laboratories(idlaboratory) ON UPDATE CASCADE;


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-09-16 21:19:31 -05

--
-- PostgreSQL database dump complete
--
