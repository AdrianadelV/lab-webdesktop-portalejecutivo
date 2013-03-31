var idindicadorc = null;
var rols_idc = null;
var id_indicadorc1 = null;
var id_indicadorc2 = null;
var id_indicadorc3 = null;
var id_indicadorc4 = null;
var id_indicadorc5 = null;
var id_indicadorc6 = null;
var id_indicadorc7 = null;
var id_indicadorc8 = null;
var id_indicadorc9 = null;
var id_indicadorc10 = null;

Ext.define('indicadoreseje', {
	extend : 'Ext.window.Window',

	height : 500,
	width : 380,
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
				 x : 50,
				 y : 30,
				 width : 280,
				 heigth : 50,
				 id: 'indicadorc1',
				 text : ''
			 }, 
			{
				xtype : 'label',
				x : 50,
				y : 90,
				height : 50,
				width : 280,
				id: 'indicadorc2',
				text : ''
			}, {
				xtype : 'label',
				x : 50,
				y : 150,
				height : 50,
				width : 280,
				id: 'indicadorc3',
				text : ''
			}, {
				xtype : 'label',
				x : 50,
				y : 210,
				height : 50,
				width : 280,
				id: 'indicadorc4',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 270,
				height : 50,
				width : 280,
				id: 'indicadorc5',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 330,
				height : 50,
				width : 280,
				id: 'indicadorc6',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 390,
				height : 50,
				width : 280,
				id: 'indicadorc7',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 450,
				height : 50,
				width : 280,
				id: 'indicadorc8',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 510,
				height : 50,
				width : 280,
				id: 'indicadorc9',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 570,
				height : 50,
				width : 280,
				id: 'indicadorc10',
				text : ''
			},{ 
	             xtype:'botonc1',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'botonc2',
	             viewConfig: {
	             }
	          },{ 
	             xtype:'botonc3',
	             viewConfig: {
	             }
	          },{ 
	             xtype:'botonc4',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'botonc5',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'botonc6',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'botonc7',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'botonc8',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'botonc9',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'botonc10',
	             viewConfig: {
	             }
	         },
			]
		});

		me.callParent(arguments);
	}
}); 

function buscar_usuarioLoCon() {
	Ext.Ajax.request({
		url : '/menu_ensambladora/buscar_usuario',
		params: {
			  ajax : 'true',
			  funcion : 'buscar_usuario',
		      nombre: document.getElementById("user_name").textContent,
		   },
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				rols_idc=datos.rols_id;
				alert(rols_idc);
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado buscar rols");
		}
	});
}

function buscar_indicadorCon() {
	Ext.Ajax.request({
		url : '/menu_ensambladora/buscar_indicador',
		params : {
			ajax : 'true',
			funcion : 'buscar_indicador',
			rol_usu : rols_idc,
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			dato = Ext.JSON.decode(exito.responseText);
			if (dato.exito == 'false') {
				Ext.Msg.alert("Error", dato.msg);
			} else {
					 Ext.getCmp('indicador1').setText(dato.datos[0].nombre_indic);
					 id_indicadorc1=dato.datos[0].id_indicador;
					 if (id_indicadorc1!=null) {
					 	botonc1 = Ext.create('miBoton1');
					 	botonc1.show();
					 };
					 Ext.getCmp('indicador2').setText(dato.datos[1].nombre_indic);
					 id_indicadorc2=dato.datos[1].id_indicador;
					 if (id_indicadorc2!=null) {
					 	botonc2 = Ext.create('miBoton2');
					 	botonc2.show();
					 };
					 Ext.getCmp('indicador3').setText(dato.datos[2].nombre_indic);
					 id_indicadorc3=dato.datos[2].id_indicador;
					 if (id_indicadorc3!=null) {
					 	botonc3 = Ext.create('miBoton3');
					 	botonc3.show();
					 };
					 Ext.getCmp('indicador4').setText(dato.datos[3].nombre_indic);
					 id_indicadorc4=dato.datos[3].id_indicador;
					 if (id_indicadorc4!=null) {
					 	botonc4 = Ext.create('miBoton4');
					 	botonc4.show();
					 };
					 Ext.getCmp('indicador5').setText(dato.datos[4].nombre_indic);
					 id_indicadorc5=dato.datos[4].id_indicador;
					 if (id_indicadorc5!=null) {
					 	botonc5 = Ext.create('miBoton5');
					 	botonc5.show();
					 };
					 Ext.getCmp('indicador6').setText(dato.datos[5].nombre_indic);
					 id_indicadorc6=dato.datos[5].id_indicador;
					 if (id_indicadorc6!=null) {
					 	botonc6 = Ext.create('miBoton6');
					 	botonc6.show();
					 };
					 Ext.getCmp('indicador7').setText(dato.datos[6].nombre_indic);
					 id_indicadorc7=dato.datos[6].id_indicador;
					 if (id_indicadorc7!=null) {
					 	botonc7 = Ext.create('miBoton7');
					 	botonc7.show();
					 };
					 Ext.getCmp('indicador8').setText(dato.datos[7].nombre_indic);
					 id_indicadorc8=dato.datos[7].id_indicador;
					 if (id_indicadorc8!=null) {
					 	botonc8 = Ext.create('miBoton8');
					 	botonc8.show();
					 };
					 Ext.getCmp('indicador9').setText(dato.datos[8].nombre_indic);
					 id_indicadorc9=dato.datos[8].id_indicador;
					 if (id_indicadorc9!=null) {
					 	botonc9 = Ext.create('miBoton9');
					 	botonc9.show();
					 };
					 Ext.getCmp('indicador10').setText(dato.datos[9].nombre_indic);
					 id_indicadorc10=dato.datos[9].id_indicador;
					 if (id_indicadorc10!=null) {
					 	botonc10 = Ext.create('miBoton10');
					 	botonc10.show();
					 };
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");
		}
	});
}

botonc1= Ext.define('miBotonc1', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc1',
	y : 30,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc1 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon1();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};	
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc2= Ext.define('miBotonc2', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc2',
    y : 90,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc2 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon2();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc3= Ext.define('miBotonc3', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc3',
    y : 150,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc3 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon3();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc4= Ext.define('miBotonc4', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc4',
    y : 210,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc4 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon4();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc5= Ext.define('miBotonc5', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc5',
    y : 270,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc5 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon5();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc6= Ext.define('miBotonc6', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc6',
    y : 330,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc6 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon6();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc7= Ext.define('miBotonc7', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc7',
    y : 390,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc7 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon7();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc8= Ext.define('miBotonc8', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc8',
    y : 450,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc8 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon8();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc9= Ext.define('miBotonc9', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc9',
    y : 510,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc9 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon9();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

botonc10= Ext.define('miBotonc10', {
    extend: 'Ext.button.Button',
	alias: 'widget.botonc10',
    y : 570,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicadorc10 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicadorCon10();
				ventana_ind = Ext.create('indicadoresdeta');
				ventana_ind.show();
			};
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 
