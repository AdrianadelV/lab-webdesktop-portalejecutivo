var prueba = 'si escribi';
var idindicador = null;
var rols_id = null;
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
var id_indicador11 = null;
var id_indicador12 = null;
var id_indicador13 = null;
var id_indicador14 = null;

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
	          },//{ 
	             // xtype:'boton4',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton5',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton6',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton7',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton8',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton9',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton10',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton11',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton12',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton13',
	             // viewConfig: {
	             // }
	         // },{ 
	             // xtype:'boton14',
	             // viewConfig: {
	             // }
	         // },
			 {
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
				// Ext.Msg.alert("Exitoso", "si paso");
				rols_id=datos.rols_id;
				alert(rols);
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado buscar rols");
		}
	});
}

function buscar_indicador() {
	alert('metodo buscar indicador');
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
					 id_indicador1=dato.datos[0].id_indicador;
					 // alert('boton 1'+id_indicador1);
					 if (id_indicador1=null) {
					 	alert('boton 1'+id_indicador1);
					 	boton1 = Ext.create('miBoton1');
					 	boton1.show();
					 };
					 Ext.getCmp('indicador2').setText(dato.datos[1].nombre_indic);
					 id_indicador2=dato.datos[1].id_indicador;
					 if (id_indicador2=null) {
					 	boton2 = Ext.create('miBoton2');
					 	boton2.show();
					 };
					 Ext.getCmp('indicador3').setText(dato.datos[2].nombre_indic);
					 id_indicador3=dato.datos[2].id_indicador;
					 if (id_indicador3=null) {
					 	boton3 = Ext.create('miBoton3');
					 	boton3.show();
					 };
					 // Ext.getCmp('indicador4').setText(dato.datos[3].nombre_indic);
					 // id_indicador4=dato.datos[3].id_indicador;
					 // if (id_indicador4!=null) {
					 	// boton4 = Ext.create('miBoton4');
					 	// boton4.show();
					 // };
					 // Ext.getCmp('indicador5').setText(dato.datos[4].nombre_indic);
					 // id_indicador5=dato.datos[4].id_indicador;
					 // if (id_indicador5!=null) {
					 	// boton5 = Ext.create('miBoton5');
					 	// boton5.show();
					 // };
					 // Ext.getCmp('indicador6').setText(dato.datos[5].nombre_indic);
					 // id_indicador6=dato.datos[5].id_indicador;
					 // if (id_indicador6!=null) {
					 	// boton6 = Ext.create('miBoton6');
					 	// boton6.show();
					 // };
					 // Ext.getCmp('indicador7').setText(dato.datos[6].nombre_indic);
					 // id_indicador7=dato.datos[6].id_indicador;
					 // if (id_indicador7!=null) {
					 	// boton7 = Ext.create('miBoton7');
					 	// boton7.show();
					 // };
					 // Ext.getCmp('indicador8').setText(dato.datos[7].nombre_indic);
					 // id_indicador8=dato.datos[7].id_indicador;
					 // if (id_indicador8!=null) {
					 	// boton8 = Ext.create('miBoton8');
					 	// boton8.show();
					 // };
					 // Ext.getCmp('indicador9').setText(dato.datos[8].nombre_indic);
					 // id_indicador9=dato.datos[8].id_indicador;
					 // if (id_indicador9!=null) {
					 	// boton9 = Ext.create('miBoton9');
					 	// boton9.show();
					 // };
					 // Ext.getCmp('indicador10').setText(dato.datos[9].nombre_indic);
					 // id_indicador10=dato.datos[9].id_indicador;
					 // if (id_indicador10!=null) {
					 	// boton10 = Ext.create('miBoton10');
					 	// boton10.show();
					 // };
					 // Ext.getCmp('indicador11').setText(dato.datos[10].nombre_indic);
					 // id_indicador11=dato.datos[10].id_indicador;
					 // if (id_indicador11!=null) {
					 	// boton11 = Ext.create('miBoton11');
					 	// boton11.show();
					 // };
					 // Ext.getCmp('indicador12').setText(dato.datos[11].nombre_indic);
					 // id_indicador12=dato.datos[11].id_indicador;
					 // if (id_indicador12!=null) {
					 	// boton12 = Ext.create('miBoton12');
					 	// boton12.show();
					 // };
					 // Ext.getCmp('indicador13').setText(dato.datos[12].nombre_indic);
					 // id_indicador13=dato.datos[12].id_indicador;
					 // if (id_indicador13!=null) {
					 	// boton13 = Ext.create('miBoton13');
					 	// boton13.show();
					 // };
					 // Ext.getCmp('indicador14').setText(dato.datos[13].nombre_indic);
					 // id_indicador14=dato.datos[13].id_indicador;
					 // if (id_indicador14!=null) {
					 	// boton14 = Ext.create('miBoton14');
					 	// boton14.show();
					 // };
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado del buscar indicador");

		}
	});
}

boton1= Ext.define('miBoton1', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton1',
    x : 215,
    y : 100,
    height : 28,
	width : 50,
	text : 'ton1',
	listeners : {
		click : function() {
			alert('pise el boton');
			asignarDetalleIndicador();
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 200,
    height : 28,
	width : 50,
	text : 'ton2',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 300,
    height : 28,
	width : 50,
	text : 'ton3',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 400,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 500,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 600,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 700,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 800,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 900,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
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
    x : 215,
    y : 1000,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

boton11= Ext.define('miBoton11', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton11',
    x : 215,
    y : 1100,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

boton12= Ext.define('miBoton12', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton12',
    x : 215,
    y : 1200,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

boton13= Ext.define('miBoton13', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton13',
    x : 215,
    y : 1300,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
}); 

boton14= Ext.define('miBoton14', {
    extend: 'Ext.button.Button',
	alias: 'widget.boton14',
    x : 215,
    y : 1400,
    height : 28,
	width : 50,
	text : 'Detalles',
	listeners : {
		click : function() {
			alert('pise el boton');
			ventana_ind = Ext.create('indicadoresdeta');
			ventana_ind.show();
		}
	},
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }
});