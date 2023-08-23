CREATE TABLE public.ciudadanos (
    idCiudadano integer NOT NULL,
    jefe integer,
    cedula character(10) NOT NULL,
    nombres varchar(25) NOT NULL,
    apellidos varchar(25) NOT NULL,
    genero public.genero_persona NOT NULL,
    fechaNacimiento date NOT NULL,
    telefono character(10) NOT NULL,
    correo varchar(40) NOT NULL,
    discapacidad varchar(255),
    enfermedad varchar(255),
    usuario varchar(25),
    contrasena varchar(255),
    estado tipoCuenta,
    provincia varchar(50),
    canton varchar(50),
    comunidad varchar(50),
    parroquia
    urlImagen text,
    horaCreacion time without time zone,
    fechaCreacion date,
    activo boolean DEFAULT false NOT NULL,
);