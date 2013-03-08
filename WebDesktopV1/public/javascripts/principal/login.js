function enviar() {
	capturaUsuario();
	Ext.Ajax.request({
		url : 'inicio/autenticarUsuario',
		//Enviando los parametros a la pagina servidora
		params : {
			id_usuario : nombre,
			password : contrasenausuario
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(resultado, request) {
			datos = Ext.JSON.decode(resultado.responseText);
			if (datos.exito) {
				Ext.Msg.alert("Error", "Usuario o clave incorrecta!");
			} else {
				if (datos.u_id_rol=='1') {
					location.href='cli_comprador'
				}if (datos.u_id_rol=='2') {
					location.href='concesionario'	
				}if (datos.u_id_rol=='3'){
					location.href='menu_ensambladora'	
				}if(datos.u_id_rol=='4'){
					location.href='menu_admin'
				}
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");
		}
	});
}


