CREATE FUNCTION Enable_Acount(
	idEmployed character, 
	userEmployed character varying, 
	passwordEmployed character varying
) RETURNS TABLE(idResponse integer, messageResponse text) LANGUAGE plpgsql
AS $$
  declare ID_HTTTP_SUCCESS integer default 201;/* codigo http de que se ha creado el recurso */ 
  declare RESPONSE_HTTTP_SUCCES text default 'Se ha activo correctamente la cuenta: '|| userEmployed;

  declare ID_HTTP_NOT_FOUND integer default 404;/* codigo http de que no existe el recurso */
  declare RESPONSE_HTTTP_CONFLICT text default 'Este usuario ya existe: '|| userEmployed;

  declare ID_HTTP_CONFLICT integer 409;/* codigo http de que ya existe el recurso */
  declare RESPONSE_HTTTP_NOT_FOUND text default 'Su cuenta ya ha sido activada con anterioridad: '|| userEmployed;

  declare codigo_empleado integer;
  declare cuenta_usuario integer;
begin 

	codigo_empleado = verificar_cuenta_ciudadano(cedula_empleado);
	cuenta_usuario = verificar_cuenta(usuario_empleado);

	if not (codigo_empleado is null) then
		if (cuenta_usuario is null) then
			
			update ciudadanos 
			set usuario = usuario_empleado, contrasena = contrasena_empleado
			where id_ciudadano = codigo_empleado;

			return query(select ID_SUCCESS,RESPONSE_HTTTP_SUCCES);

		else 
			return  query(select RESPONSE_HTTTP_CONFLICT,RESPONSE_HTTTP_NOT_FOUND);
		end if;
	else
		return query(select ID_HTTP_CONFLICT,RESPONSE_HTTTP_CONFLICT);
	end if;

end; 
$$;