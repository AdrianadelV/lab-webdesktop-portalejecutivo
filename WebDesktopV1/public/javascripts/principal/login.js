Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup', 'Ext.panel.Panel']);
function enviar() {
	capturaUsuario();
	Ext.Ajax.request({
		url : 'inicio/autenticarUsuario',
		//Enviando los parametros a la pagina servidora
		params : {
			nombre : nombre,
			password : contrasenausuario
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(resultado, request) {
			datos = Ext.JSON.decode(resultado.responseText);
			if (datos.exito) {
				Ext.Msg.alert("Error", "Usuario o clave incorrecta!");
			} else {
				if (datos.rol_id=='1') {
					location.href='cli_comprador'
				}if (datos.rol_id=='2') {
					location.href='concesionario'	
				}if (datos.rol_id=='3'){
					location.href='menu_ensambladora'	
				}if(datos.rol_id=='4'){
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