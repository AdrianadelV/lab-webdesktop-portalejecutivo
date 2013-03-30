var primeravez = true;
var id_vehiculo = null;
var id_ensambladora = null;
var id_marca_sel = null;
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

//Definicion del Modelo Caracteristica del Color
Ext.define('Caracteristicas_Color', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'id',
		type : 'int'
	}, {
		name : 'valor',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'menu_admin/generardatacomboscaracteristicas_modelo_color'
	}
});

//Definicion del Modelo Caracteristica de Tapiceria
Ext.define('Caracteristicas_Tapiceria', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'id',
		type : 'int'
	}, {
		name : 'valor',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'menu_admin/generardatacomboscaracteristicas_modelo_tapiceria'
	}
});

//Definicion del Modelo Caracteristica de Trasmision
Ext.define('Caracteristicas_Trasmision', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'id',
		type : 'int'
	}, {
		name : 'valor',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'menu_admin/generardatacomboscaracteristicas_modelo_trasmision'
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

//Definicion del Data Store de la Caracteristicas Color
var caracteristicacolorStore = Ext.create('Ext.data.Store', {
	model : 'Caracteristicas_Color',
	autoLoad : true,
});

//Definicion del Data Store de la Caracteristicas Trasmision
var caracteristicatrasmisionStore = Ext.create('Ext.data.Store', {
	model : 'Caracteristicas_Trasmision',
	autoLoad : true,
});

//Definicion del Data Store de la Caracteristicas Tapiceria
var caracteristicatapiceriaStore = Ext.create('Ext.data.Store', {
	model : 'Caracteristicas_Tapiceria',
	autoLoad : true,
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
									id_marca_sel = rec[0].get(combo.valueField);
									buscarIdEnsambladora_Marca(id_marca_sel);
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
									buscarModelos (id_modelo);
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
					          width: 400
	                 	},{
							xtype : 'label',
							x : 500,
							y : 50,
							height : 40,
							width : 300,
							text : 'Caracteristicas del Modelo'
						},{
	                 		xtype : 'textfield',
							x : 450,
							y : 90,
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
							y : 140,
							width : 300,
							id : 'precio',
							msgTarget : 'under',
							blankText : 'Este campo es requerido',
							enableKeyEvents : true,
							fieldLabel : 'Precio',
							//disabled : true
	                 	},{
	                 		xtype: 'combobox',
                            x : 450,
							y : 190,
							width : 300,
                            fieldLabel: 'Tapiceria',
							id : 'cmb_tapiceria',
							store : caracteristicatapiceriaStore,
							valueField : 'id',
							displayField : 'valor',
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
								}
							}
	                 	},{
							xtype: 'combobox',
                            x : 450,
							y : 240,
							width : 300,
                            fieldLabel: 'Trasmision',
							id : 'cmb_trasmision',
							store : caracteristicatrasmisionStore,
							valueField : 'id',
							displayField : 'valor',
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
								}
							}
							
	                 	},{
							xtype: 'combobox',
                            x : 450,
							y : 290,
							width : 300,
                            fieldLabel: 'Color',
							id : 'cmb_color',
							store : caracteristicacolorStore,
							valueField : 'id',
							displayField : 'valor',
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
								}
							}
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
				//buscarCaracteristicasModelo();	 
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}
