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
				Ext.Msg.alert("Error", datos.id_usuario);
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");
		}
	});
}


