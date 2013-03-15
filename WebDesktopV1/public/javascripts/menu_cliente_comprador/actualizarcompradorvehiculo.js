//Calcular las posiciones x,y segun la resolucion del monitor del cliente para el tabpanel por ser un layout absolute
var posx = 0;
var posy = 0;
var factorw = 0.001;
var factorh = 0.10;
//1024x768
if (screen.width == 1024 && screen.height == 768) {
	factorw = 0.025;
	factorh = 0.10;
}
//1280x800
if (screen.width == 1280 && screen.height == 800) {
	factorw = 0.080;
	factorh = 0.10;
}
//1280x1024
if (screen.width == 1280 && screen.height == 1024) {
	factorw = 0.020;
	factorh = 0.005;
}
posx = parseInt(screen.width * factorw);
posy = parseInt(screen.height * factorh);
var usuariologeado = "";
var datos2 = "";

Ext.define('actualizar', {
	extend : 'Ext.window.Window',

	height : 360,
	id : 'actualizardatos',
	width : 500,
	x : 370,
	y : 210,
	layout : {
		type : 'absolute'
	},
	title : 'Actualizar',

	initComponent : function() {
		var me = this;
		Ext.applyIf(me, {
			items : [{
				xtype : 'tabpanel',
				x : -4,
				y : -2,
				height : 360,
				activeTab : 0,
				items : [{
					xtype : 'panel',
					height : 360,
					layout : {
						type : 'absolute'
					},
					title : 'Informacion Personal',
					items : [{
						xtype : 'container'
					}, {
						xtype : 'textfield',
						x : 30,
						y : 20,
						fieldLabel : 'Nombre(s)',
						id : 'nombre'

					}, {
						xtype : 'textfield',
						x : 30,
						y : 50,
						fieldLabel : 'Apellido(s)',
						id : 'apellido'
					}, {
						xtype : 'textfield',
						x : 30,
						y : 80,
						fieldLabel : 'Direccion',
						id : 'direccion'
					}, {
						xtype : 'textfield',
						x : 30,
						y : 110,
						fieldLabel : 'Telefono',
						id : 'telefono'
					}, {
						xtype : 'textfield',
						x : 30,
						y : 140,
						fieldLabel : 'Correo',
						id : 'correo'
					}, {
						xtype : 'button',
						x : 190,
						y : 180,
						text : 'Aceptar',
						listeners : {
							click : function() {
							}
						},
						id : 'aceptar'
					}, {
						xtype : 'button',
						x : 264,
						y : 180,
						text : 'Cancelar',
						id : 'cancelar'
					}]
				}, {
					xtype : 'panel',
					height : 360,
					layout : {
						type : 'absolute'
					},
					title : 'Cuenta de Usuario',
					items : [{
						xtype : 'textfield',
						x : 60,
						y : 30,
						fieldLabel : 'Contraseña anterior',
						id : 'contrasena'
					}, {
						xtype : 'textfield',
						x : 60,
						y : 70,
						fieldLabel : 'Contraseña nueva',
						id : 'contrasenanueva'
					}, {
						xtype : 'textfield',
						x : 60,
						y : 110,
						fieldLabel : 'Repetir Contraseña',
						id : 'repetircontrasena'
					}, {
						xtype : 'button',
						x : 220,
						y : 180,
						text : 'Cargar',
						listeners : {
							click : function() {

							}
						}
					}, {
						xtype : 'button',
						x : 295,
						y : 180,
						text : 'Cancelar'
					}]
				}]
			}]
		});
		me.callParent(arguments);
	}
});
function buscar_comprador() {
	alert("buscando");
	Ext.Ajax.request({
		url : '/cli_comprador/buscarComprador',
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				Ext.getCmp('nombre').setValue(datos.nombres);
				Ext.getCmp('apellido').setValue(datos.apellidos);
				Ext.getCmp('direccion').setValue(datos.direccion);
				Ext.getCmp('telefono').setValue(datos.telefono);
				Ext.getCmp('correo').setValue(datos.correo);
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}

