var primeravez = true;
var id_vehiculo = null;
var id_ensambladora = null;
var id_marca_sel = null;
var id_modelo = null;
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

Ext.define('miVentanaGaleria', {
    extend: 'Ext.window.Window',
	y:250,
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
									buscar_precio_vehiculo();
								}
							}
                        },{
                            xtype: 'button',
                            x: 750,
                            y: 390,
                            text: 'Comprar',
                            listeners:{
                            	click:function(){
                            		var ventana_proforma=Ext.create('proforma_banco');
                    				ventana_proforma.show();
                       				buscar_comprador();
                            		Ext.getCmp('modelo_vehiculo').setValue(Ext.getCmp('cmb_modelo').getRawValue());
                            		Ext.getCmp('marca_vehiculo').setValue(Ext.getCmp('cmb_marca').getRawValue());
                            		Ext.getCmp('ano_vehiculo').setValue(Ext.getCmp('ano_v').getValue());
                            		Ext.getCmp('color_vehiculo').setValue(Ext.getCmp('cmb_color').getRawValue());
                            		Ext.getCmp('costo_vehiculo').setValue(Ext.getCmp('precio').getValue());
                            		Ext.getCmp('transmision_vehiculo').setValue(Ext.getCmp('cmb_trasmision').getRawValue());
                            		Ext.getCmp('tapiceria').setValue(Ext.getCmp('cmb_tapiceria').getRawValue());
                                    id_color();
                            		id_transmision();
                            		id_tapiceria();
                            		var currentDate = new Date();
								    Ext.getCmp('fecha2').setValue(currentDate);
									var day=currentDate.getDate();
									 // el mes es devuelto entre 0 y 11
									var month=currentDate.getMonth()+1;
									var year=currentDate.getFullYear();    
									var tiempo=currentDate.getTime();
									 //Calculamos los milisegundos sobre la fecha que hay que sumar o restar...
									var milisegundos=parseInt(30*24*60*60*1000);
									 //Modificamos la fecha actual
									var total=currentDate.setTime(tiempo+milisegundos);
									day=currentDate.getDate();
									month=currentDate.getMonth()+1;
									year=currentDate.getFullYear();
									currentDate.setDate(day);
									currentDate.setMonth(month);
									currentDate.setYear(year);			
								    Ext.getCmp('validez').setValue(currentDate);
								    
                            	}
                            },
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
function guardar_detallevehiculo (id_modelo) {
  Ext.Ajax.request({
		url : '/cli_comprador/guardardetallevehiculo',
		params: {
			ajax: 'true',
            funcion: 'guardardetallevehiculo',
            color: Ext.getCmp('cmb_color').getValue(),
            transmision:Ext.getCmp('cmb_trasmision').getValue(),
            tapiceria:Ext.getCmp('cmb_tapiceria').getValue(),
            modelo_vehiculos_id:id_modelo,
		},
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				Ext.Msg.alert("Exito", 'Se ha guardado el detalle de vehiculo');
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}
function buscar_precio_vehiculo() {
	Ext.Ajax.request({
		//Llamar la direcion del servicio
		url : 'cliente_resful/call_service2_precio_vehiculo',
		method : 'GET',
		type : 'json',
		params:{
				 ajax: 'true',
				 id_modelo: Ext.getCmp('cmb_modelo').getValue(),
			},
		success : function(resultado, request) {
			//La tira JSON donde retorna los valores
			datos = Ext.JSON.decode(resultado.responseText);
			if (datos != null) {
				Ext.getCmp('precio').setValue(datos.Precio);
			} else {
				alert('Existe Precios para este Vehiculo por Indepabis');
			}
		},
		failure : function(error) {
			Ext.Msg.alert("Error", "Falla al Conectar con los Servicios-EAI");
		}
	});
}

function id_color(){
	var id_color=Ext.getCmp('cmb_color').getValue();
	return id_color;
}
function id_transmision()
{
	var id_transmision=Ext.getCmp('cmb_trasmision').getValue();
	return id_transmision;
}
function id_tapiceria(){
	var id_tapiceria=Ext.getCmp('cmb_tapiceria').getValue();
	return id_tapiceria
}