var prueba = 'si escribi';
var idindicador = null;
var rols_id = null;

Ext.define('indicadoreseje', {
	extend : 'Ext.window.Window',

	height : 500,
	width : 320,
	collapsible : true,
	y : 207,
	x : 1095,
	autoScroll : true,
	layout : {
		type : 'absolute'
	},
	title : 'Indicadores',

	initComponent : function() {
		var me = this;

		Ext.applyIf(me, {
			items : [
			{
				 xtype : 'label',
				 x : 45,
				 y : 30,
				 border : 'solid',
				 width : 140,
				 heigth : 80,
				 id: 'indicador1',
				 text : ''
			 }, 
			{
				xtype : 'label',
				x : 45,
				y : 115,
				height : 80,
				width : 140,
				id: 'indicador2',
				text : ''
			}, {
				xtype : 'label',
				x : 45,
				y : 195,
				height : 80,
				width : 140,
				id: 'indicador3',
				text : ''
			}, {
				xtype : 'label',
				x : 45,
				y : 280,
				height : 80,
				width : 140,
				id: 'indicador4',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 365,
				height : 80,
				width : 140,
				id: 'indicador5',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 450,
				height : 80,
				width : 140,
				id: 'indicador6',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 535,
				height : 80,
				width : 140,
				id: 'indicador7',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 620,
				height : 80,
				width : 140,
				id: 'indicador8',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 705,
				height : 80,
				width : 140,
				id: 'indicador9',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 790,
				height : 80,
				width : 140,
				id: 'indicador10',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 875,
				height : 80,
				width : 140,
				id: 'indicador11',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 960,
				height : 80,
				width : 140,
				id: 'indicador12',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 1045,
				height : 80,
				width : 140,
				id: 'indicador13',
				text : ''
			},{
				xtype : 'label',
				x : 45,
				y : 1130,
				height : 80,
				width : 140,
				id: 'indicador14',
				text : ''
			},{
				xtype : 'button',
				x : 205,
				y : 30,
				text : 'Detalles',
				listeners : {
					click : function() {
						ventana_ind = Ext.create('indicadoresdeta');
						ventana_ind.show();
						
					}
				}
			}, {
				xtype : 'button',
				x : 205,
				y : 115,
				text : 'Detalles',
				listeners : {
					click : function() {
						buscar_indicador();
						ventana_ind = Ext.create('indicadoresdeta');
						ventana_ind.show();
					}
				}
			}, {
				xtype : 'button',
				x : 205,
				y : 195,
				text : 'Detalles',
				listeners : {
					click : function() {
						ventana_ind = Ext.create('indicadoresdeta');
						ventana_ind.show();
					}
				}
			}, {
				x : 10,
				y : 30,
				height : 28,
				width : 27,
				html : '<div align="left"><img src="images/rojo.jpg""></div>'
			}, {
				x : 10,
				y : 115,
				height : 28,
				width : 27,
				html : '<div align="left"><img src="images/amarillo.jpg""></div>'
			}, {
				x : 10,
				y : 195,
				height : 28,
				width : 27,
				html : '<div align="left"><img src="images/amarillo.jpg""></div>'
			}]
		});

		me.callParent(arguments);
	}
}); 

function buscar_usuarioLo() {
	Ext.Ajax.request({
		url : '/menu_ensambladora/buscar_usuariolo',
		params: {
			  ajax : 'true',
			  funcion : 'buscar_usuariolo',
		      nombre: document.getElementById("user_name").textContent,
		   },
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				// Ext.Msg.alert("Exitoso", "si paso");
				rols_id=datos.rols_id;
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}

function buscar_indicador() {
	Ext.Ajax.request({
		url : '/menu_ensambladora/buscar_indicador',
		params : {
			ajax : 'true',
			funcion : 'buscar_indicador',
			rol_usu : rols_id,
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			dato = Ext.JSON.decode(exito.responseText);
			if (dato.exito == 'false') {
				Ext.Msg.alert("Error", dato.msg);
			} else {
					 Ext.getCmp('indicador1').setText(dato.datos[0].nombre_indic);
					 Ext.getCmp('indicador2').setText(dato.datos[1].nombre_indic);
					 Ext.getCmp('indicador3').setText(dato.datos[2].nombre_indic);
					 Ext.getCmp('indicador4').setText(dato.datos[3].nombre_indic);
					 Ext.getCmp('indicador5').setText(dato.datos[4].nombre_indic);
					 Ext.getCmp('indicador6').setText(dato.datos[5].nombre_indic);
					 Ext.getCmp('indicador7').setText(dato.datos[6].nombre_indic);
					 Ext.getCmp('indicador8').setText(dato.datos[7].nombre_indic);
					 Ext.getCmp('indicador9').setText(dato.datos[8].nombre_indic);
					 Ext.getCmp('indicador10').setText(dato.datos[9].nombre_indic);
					 Ext.getCmp('indicador11').setText(dato.datos[10].nombre_indic);
					 Ext.getCmp('indicador12').setText(dato.datos[11].nombre_indic);
					 Ext.getCmp('indicador13').setText(dato.datos[12].nombre_indic);
					 Ext.getCmp('indicador14').setText(dato.datos[13].nombre_indic);
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}
