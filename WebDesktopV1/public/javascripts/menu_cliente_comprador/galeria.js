var primeravez = true;
var id_vehiculo = null;
var id_car_modelo = null;
Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*',
				'Ext.container.Viewport',
    			'Ext.container.ButtonGroup',
    			'Ext.panel.Panel'
	         ]);

//Definicion del Modelo Marcas
Ext.define('Marcas', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'id',
		type : 'int'
	}, {
		name : 'nombre',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'menu_admin/generarcomboMarcas'
	}
});

//Definicion del Modelo del Modelo
Ext.define('Modelo', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'marcas_id',
		type : 'int'
	}, {
		name : 'id',
		type : 'int'
	}, {
		name : 'descripcion',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'menu_admin/generardatacombosmodelos'
	}
});

//Definicion del Data Store de Marcas
var marcaStore = Ext.create('Ext.data.Store', {
	model : 'Marcas',
	autoLoad : true,
});

//Definicion del Data Store de Modelos
var modelosStore = Ext.create('Ext.data.Store', {
	model : 'Modelo',
	autoLoad : true,
});
//Definicion del Panel contenedor de la imagen
var panel = Ext.define('miVentana',{ 
	extend: 'Ext.Panel',
   width: 300, 
   height: 1100, 
   alias: 'widget.imagenpanel',
   tpl : new Ext.XTemplate('<div><img src="{url}" style="height:300px; width:400px;" /></div>')
   
}); 

var imagenUrl = "/public/images/modelovehiculo/chevrolet 4x4 .jpg"; 


Ext.define('miVentanaGaleria', {
    extend: 'Ext.window.Window',

    height: 500,
    width: 900,
    layout: {
        type: 'absolute'
    },
    title: 'Galeria',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    x: -1,
                    y: 10,
                    height: 500,
                    width: 900,
                    layout: {
                        type: 'absolute'
                    },
                    bodyPadding: 10,
                    title: '',
                    items: [{
                            xtype: 'combobox',
                            x: 20,
                            y: 20,
                            fieldLabel: 'Marca',
							store : marcaStore,
							id : 'cmb_marca',
							valueField : 'id',
							displayField : 'nombre',
							queryMode : 'remote',
							typeAhead : true,
							emptyText : 'Seleccionar',
							triggerAction : 'all',
							editable : 'false',
							selecOnFocus : true,
							listeners : {
								scope : this,
								select : function(combo, rec) {
									var marca_val = rec[0].get(combo.valueField);
									// alert(estado_val);
									var marcas_obj = Ext.getCmp('cmb_modelo');
									if (primeravez) {
										primeravez = false;
										marcas_obj.clearValue();
									} else {
										marcas_obj.clearValue();
										marcas_obj.getStore().clearFilter();
									}
									marcas_obj.store.filter('marcas_id', marca_val);
								}
							}
                        },{
                            xtype: 'combobox',
                            x: 340,
                            y: 20,
                            fieldLabel: 'Modelos',
							id : 'cmb_modelo',
							store : modelosStore,
							valueField : 'id',
							displayField : 'descripcion',
							queryMode : 'remote',
							typeAhead : true,
							emptyText : 'Seleccionar',
							triggerActio : 'all',
							editable : 'false',
							selecOnFocus : true,
							listeners : {
								scope : this,
								select : function(combo, rec) {
									//alert(rec[0].get(combo.valueField));
									var id_modelo=rec[0].get(combo.valueField);
									Ext.getCmp('tapiceria').setValue("");
									Ext.getCmp('trasmision').setValue("");
									Ext.getCmp('color').setValue("");
									buscarModelos (id_modelo);
									buscarCaracteristicasModelo(id_modelo);
								}
							}
                        },{
                            xtype: 'button',
                            x: 750,
                            y: 390,
                            text: 'Comprar'
                        },{
                        	xtype: 'imagenpanel',
					          id: 'imagen',
					          x: 20,
					          y: 70,
					          border: '1',
					          frame: true,
					          height: 300,
					          width: 400,
	                 	},{
							xtype : 'label',
							x : 500,
							y : 50,
							height : 40,
							width : 300,
							text : 'Caracteristicas del Modelo'
						},{
                        	xtype: 'combobox',
                            x: 450,
                            y: 90,
                            width : 300,
                            fieldLabel: 'Caracteristicas',
                        },{
	                 		xtype : 'textfield',
							x : 450,
							y : 140,
							width : 300,
							id : 'ano_v',
							msgTarget : 'under',
							blankText : 'Este campo es requerido',
							enableKeyEvents : true,
							fieldLabel : 'Año del Vehiculo',
							//disabled : true
	                 	},{
	                 		xtype : 'textfield',
							x : 450,
							y : 190,
							width : 300,
							id : 'tapiceria',
							msgTarget : 'under',
							blankText : 'Este campo es requerido',
							enableKeyEvents : true,
							//disabled : true
	                 	},{
	                 		xtype : 'textfield',
							x : 450,
							y : 240,
							width : 300,
							id : 'color',
							msgTarget : 'under',
							blankText : 'Este campo es requerido',
							enableKeyEvents : true,
							//disabled : true
	                 	},{
	                 		xtype : 'textfield',
							x : 450,
							y : 290,
							width : 300,
							id : 'trasmision',
							msgTarget : 'under',
							blankText : 'Este campo es requerido',
							enableKeyEvents : true,
							//disabled : true
	                 	},{
	                 		xtype : 'textfield',
							x : 450,
							y : 340,
							width : 300,
							id : 'precio',
							msgTarget : 'under',
							blankText : 'Este campo es requerido',
							enableKeyEvents : true,
							fieldLabel : 'Precio',
							//disabled : true
	                 	}
	                ]
                }
            ]
        });

        me.callParent(arguments);
    }
});
function buscarModelos (id_modelo) {
	Ext.Ajax.request({
		url : '/cli_comprador/buscarModelosVehiculos',
		params: {
			ajax: 'true',
            funcion: 'buscarModelosVehiculos',
            id: id_modelo
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
			
				var imagenUrl=datos.imagen3;
				id_vehiculo=datos.id;
				Ext.getCmp('ano_v').setValue(datos.ano_m);
				Ext.getCmp('imagen').update({url:imagenUrl});
				buscarCaracteristicasModelo();	 
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}
function buscarCaracteristicasModelo () {
  //alert(id_vehiculo);
	Ext.Ajax.request({
		url : '/cli_comprador/buscarCaracteristicasModelos',
		params: {
			ajax: 'true',
            funcion: 'buscarCaracteristicasModelos',
            modelo_vehiculos_id: id_vehiculo
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				// Ext.Msg.alert("Exito", 'Encontro');
				for (var i=0; i < datos.length; i++) {
				  id_car_modelo=datos[i].caracteristicas_id;
				  buscarValorCaracteristica (id_car_modelo);
				};
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}
function buscarValorCaracteristica (id_car_modelo) {
  Ext.Ajax.request({
		url : '/cli_comprador/buscarValorCaracteristicasModelos',
		params: {
			ajax: 'true',
            funcion: 'buscarValorCaracteristicasModelos',
            caracteristicas_id: id_car_modelo
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				if(datos[0].nombre=='Color'){
					Ext.getCmp('color').setValue(datos[0].valor);
				};
				if (datos[0].nombre=='Trasmision') {
					Ext.getCmp('trasmision').setValue(datos[0].valor);
				};
				if (datos[0].nombre=='Tapiceria') {
					Ext.getCmp('tapiceria').setValue(datos[0].valor);
				};	
				//Ext.Msg.alert("Exito", 'Encontro');
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}