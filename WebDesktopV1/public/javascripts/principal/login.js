

function enviar() {
	alert("paso");
	var header = Ext.Ajax.defaultHeaders = {
 'Accept': 'application/json'
};
	Ext.Ajax.request({
		url : 'http://192.168.1.122:8080/serviciosAEVEV/Usuarios/autenticarUsuario',
		  defaultHeaders: header,
		//Enviando los parametros a la pagina servidora
		params : {
			login :'adrianas',
			contrasena : '1234'
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(resultado, request) {
			datos = Ext.JSON.decode(resultado.responseText);
			if (datos.exito) {
				alert(datos.nombre_login);
			} else {
				Ext.Msg.alert("Error", "Usuario o clave incorrecta!");
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");
		}
	});
}

