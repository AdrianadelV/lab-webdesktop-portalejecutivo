var idindicador = null;
var id_indicador1 = null;
var id_indicador2 = null;
var id_indicador3 = null;
var id_indicador4 = null;
var id_indicador5 = null;
var id_indicador6 = null;
var id_indicador7 = null;
var id_indicador8 = null;
var id_indicador9 = null;
var id_indicador10 = null;
var rols_id = null;

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
				 id: 'indicador1',
				 text : ''
			 }, 
			{
				xtype : 'label',
				x : 50,
				y : 90,
				height : 50,
				width : 280,
				id: 'indicador2',
				text : ''
			}, {
				xtype : 'label',
				x : 50,
				y : 150,
				height : 50,
				width : 280,
				id: 'indicador3',
				text : ''
			}, {
				xtype : 'label',
				x : 50,
				y : 210,
				height : 50,
				width : 280,
				id: 'indicador4',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 270,
				height : 50,
				width : 280,
				id: 'indicador5',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 330,
				height : 50,
				width : 280,
				id: 'indicador6',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 390,
				height : 50,
				width : 280,
				id: 'indicador7',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 450,
				height : 50,
				width : 280,
				id: 'indicador8',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 510,
				height : 50,
				width : 280,
				id: 'indicador9',
				text : ''
			},{
				xtype : 'label',
				x : 50,
				y : 570,
				height : 50,
				width : 280,
				id: 'indicador10',
				text : ''
			},{ 
	             xtype:'boton1',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'boton2',
	             viewConfig: {
	             }
	          },{ 
	             xtype:'boton3',
	             viewConfig: {
	             }
	          },{ 
	             xtype:'boton4',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'boton5',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'boton6',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'boton7',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'boton8',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'boton9',
	             viewConfig: {
	             }
	         },{ 
	             xtype:'boton10',
	             viewConfig: {
	             }
	         },
			]
		});

		me.callParent(arguments);
	}
}); 

function buscar_usuarioLogueado() {
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
				rols_id=datos.rols_id;
				buscar_indicador();
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado buscar rols");
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
			nombre: document.getElementById("user_name").textContent,
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			dato = Ext.JSON.decode(exito.responseText);
			if (dato.exito == 'false') {
				Ext.Msg.alert("Error", dato.msg);
			} else {
					 if(dato.datos[0].nombre_indic!='' && dato.datos[0].id_indicador!=''){
					 	 Ext.getCmp('indicador1').setText(dato.datos[0].nombre_indic);
						 id_indicador1=dato.datos[0].id_indicador;
						 if (id_indicador1!=null) {
						 	boton1 = Ext.create('miBoton1');
						 	boton1.show();
						 };
					 };
					 
					 if(dato.datos[1].nombre_indic!='' && dato.datos[1].id_indicador!=''){
						 Ext.getCmp('indicador2').setText(dato.datos[1].nombre_indic);
						 id_indicador2=dato.datos[1].id_indicador;
						 if (id_indicador2!=null) {
						 	boton2 = Ext.create('miBoton2');
						 	boton2.show();
						 };	
					 }
					 if(dato.datos[2].nombre_indic!='' && dato.datos[2].id_indicador!=''){
					 	 Ext.getCmp('indicador3').setText(dato.datos[2].nombre_indic);
						 id_indicador3=dato.datos[2].id_indicador;
						 if (id_indicador3!=null) {
						 	boton3 = Ext.create('miBoton3');
						 	boton3.show();
						 };
					 };
					 if(dato.datos[3].nombre_indic!='' && dato.datos[3].id_indicador!=''){
					 	 Ext.getCmp('indicador4').setText(dato.datos[3].nombre_indic);
						 id_indicador4=dato.datos[3].id_indicador;
						 alert('indicador4444...'+id_indicador4);
						 if (id_indicador4!=null) {
						 	boton4 = Ext.create('miBoton4');
						 	boton4.show();
						 };
					 };
					 if(dato.datos[4].nombre_indic!='' && dato.datos[4].id_indicador!=''){
					 	 Ext.getCmp('indicador5').setText(dato.datos[4].nombre_indic);
						 id_indicador5=dato.datos[4].id_indicador;
						 if (id_indicador5!=null) {
						 	boton5 = Ext.create('miBoton5');
						 	boton5.show();
						 };
					 };
					 if(dato.datos[5].nombre_indic!='' && dato.datos[5].id_indicador!=''){
						 Ext.getCmp('indicador6').setText(dato.datos[5].nombre_indic);
						 id_indicador6=dato.datos[5].id_indicador;
						 if (id_indicador6!=null) {
						 	boton6 = Ext.create('miBoton6');
						 	boton6.show();
						 };	
					 };
					 if(dato.datos[6].nombre_indic!='' && dato.datos[6].id_indicador!=''){
						 Ext.getCmp('indicador7').setText(dato.datos[6].nombre_indic);
						 id_indicador7=dato.datos[6].id_indicador;
						 if (id_indicador7!=null) {
						 	boton7 = Ext.create('miBoton7');
						 	boton7.show();
						 };	
					 };
					 if(dato.datos[7].nombre_indic!='' && dato.datos[7].id_indicador!=''){
						 Ext.getCmp('indicador8').setText(dato.datos[7].nombre_indic);
						 id_indicador8=dato.datos[7].id_indicador;
						 if (id_indicador8!=null) {
						 	boton8 = Ext.create('miBoton8');
						 	boton8.show();
						 };	
					 };
					 if(dato.datos[8].nombre_indic!='' && dato.datos[8].id_indicador!=''){
						 Ext.getCmp('indicador9').setText(dato.datos[8].nombre_indic);
						 id_indicador9=dato.datos[8].id_indicador;
						 if (id_indicador9!=null) {
						 	boton9 = Ext.create('miBoton9');
						 	boton9.show();
						 };	
					 };
					 if(dato.datos[9].nombre_indic!='' && dato.datos[9].id_indicador!=''){
						 Ext.getCmp('indicador10').setText(dato.datos[9].nombre_indic);
						 id_indicador10=dato.datos[9].id_indicador;
						 if (id_indicador10!=null) {
						 	boton10 = Ext.create('miBoton10');
						 	boton10.show();
						 };	
					 };
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");
		}
	});
}

boton1= Ext.define('miBoton1', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton1',
	y : 30,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			alert('boton1 id´´´'+ id_indicador1);
			if (id_indicador1 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador11();
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

boton2= Ext.define('miBoton2', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton2',
    y : 90,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador2 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador2();
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

boton3= Ext.define('miBoton3', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton3',
    y : 150,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador3 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador3();
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

boton4= Ext.define('miBoton4', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton4',
    y : 210,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador4 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador4();
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

boton5= Ext.define('miBoton5', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton5',
    y : 270,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador5 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador5();
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

boton6= Ext.define('miBoton6', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton6',
    y : 330,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador6 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador6();
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

boton7= Ext.define('miBoton7', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton7',
    y : 390,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador7 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador7();
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

boton8= Ext.define('miBoton8', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton8',
    y : 450,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador8 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador8();
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

boton9= Ext.define('miBoton9', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton9',
    y : 510,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador9 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador9();
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

boton10= Ext.define('miBoton10', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton10',
    y : 570,
    x : 10,
    height : 28,
	width : 50,
	icon : 'images/lista.png',
	text : '',
	listeners : {
		click : function() {
			if (id_indicador10 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				asignarDetalleIndicador10();
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
