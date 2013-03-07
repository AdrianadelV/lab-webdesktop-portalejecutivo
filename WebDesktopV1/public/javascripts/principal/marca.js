function buscar(id_marca) {
	var marca123 = "hola";
	var ajax = Ext.Ajax.request({
		url : '/inicio/buscar',
		//Enviando los parametros a la pagina servidora
		params : {
			ajax : 'true',
			funcion : 'buscar',
			id_marca : id_marca
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(resultado, request) {
			datos = Ext.JSON.decode(resultado.responseText);
			if (datos.exito == 'true') {
				marca123 = datos.nombre_marca;
				Ext.create('MyApp.view.MyTabPanel', {
					renderTo : 'tree_el',
					title : datos.nombre_marca,
					items : [{
						xtype : 'panel',
						title : 'Quienes Somos',
						html : '<h1>' + datos.mision + '</h1><br><h1>' + datos.vision + '</h1><br><h1>' + datos.valores + '</h1><br>'
					}, {
						xtype : 'panel',
						title : 'Concesionarios',
						//html  : '<h1></h1><h1></h1><div align="center"><img src="images/mapa_mundi.png""></div>'
						html : '<iframe width="700" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.es/maps?f=d&amp;source=s_d&amp;saddr=Venezuela&amp;daddr=&amp;hl=es&amp;geocode=&amp;aq=0&amp;oq=vene&amp;sll=40.396764,-3.713379&amp;sspn=8.766144,21.643066&amp;mra=ls&amp;num=10&amp;ie=UTF8&amp;ll=6.42375,-66.58973&amp;spn=17.780303,17.893559&amp;t=m&amp;output=embed"></iframe><br /><small><a href="https://maps.google.es/maps?f=d&amp;source=embed&amp;saddr=Venezuela&amp;daddr=&amp;hl=es&amp;geocode=&amp;aq=0&amp;oq=vene&amp;sll=40.396764,-3.713379&amp;sspn=8.766144,21.643066&amp;mra=ls&amp;num=10&amp;ie=UTF8&amp;ll=6.42375,-66.58973&amp;spn=17.780303,17.893559&amp;t=m" style="color:#0000FF;text-align:left">Ver mapa más grande</a></small>',
					}, {
						xtype : 'panel',
						title : 'Contacto',
						html : '<h1>Contáctanos</h1><p>' + datos.contacto + '</p>'

					}, {
						stype : 'panel',
						title : 'Galeria de Vehiculos',
						html : '<div align="center"><img src="' + datos.imagen + '"></div>'
					}]
				});
			} else {
				Ext.Msg.alert("Error", "paso");
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");
		}
	});
}


