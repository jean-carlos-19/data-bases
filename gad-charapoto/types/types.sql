/* Generos de los ciudadanos */
/* Citizen's gender */

CREATE TYPE public.generoPerson AS ENUM (
    'Masculino',
    'Femenino'
);

/* 
    Tipos de calle que existen
    Types of streets that exist
*/

CREATE TYPE public.tipoCalle AS ENUM (
    'Principal',
    'Secundaria'
);
/* 
    Types of roles that exist in the gad 
    Tipos de roles que existen en el gad 
*/
CREATE TYPE public.tipoRol AS ENUM (
    'Secretaria',
    'Empleado',
    'Coordinador'
);