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

Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup', 'Ext.panel.Panel']);

//Definicion del Modelo Estados
Ext.define('Estados', {
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
		url : 'menu_admin/generardatacombosestados'
	}
});

//Definicion del Modelo Ciudades
Ext.define('Ciudades', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'estados_id',
		type : 'int'
	}, {
		name : 'id',
		type : 'int'
	}, {
		name : 'nombre',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'menu_admin/generardatacombosciudades'
	}
});

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
		url : 'menu_admin/generardatacomboMarcas'
	}
});

//Definicion del Data Store de Estados
var estadoStore = Ext.create('Ext.data.Store', {
	model : 'Estados',
	autoLoad : true,
});
//Definicion del Data Store de ciudades
var ciudadeStore = Ext.create('Ext.data.Store', {
	model : 'Ciudades',
	autoLoad : true,
});

//Definicion del Data Store de Marcas
var marcaStore = Ext.create('Ext.data.Store', {
	model : 'Estados',
	autoLoad : true,
});

Ext.define('VentanaEnsambladoraAdmin', {
	extend : 'Ext.window.Window',

	height : 480,
	width : 614,
	x : 380,
	y : 150,
	layout : {
		type : 'absolute'
	},
	bodyBorder : true,
	collapsible : true,
	title : 'Registrar Ensambladora',

	initComponent : function() {
		var me = this;

		Ext.applyIf(me, {
			items : [{
				xtype : 'tabpanel',
				activeTab : 0,
				items : [{
					xtype : 'form',
					height : 340,
					autoRender : false,
					id : 'formaularioensambladora',
					layout : {
						type : 'absolute'
					},
					bodyPadding : 10,
					title : 'Datos Ensambladora',
					items : [{
						xtype : 'textfield',
						x : 20,
						y : 30,
						width : 410,
						id : 'rif',
						msgTarget : 'under',
						blankText : 'Este campo es requerido',
						enableKeyEvents : true,
						minLength : 1,
						emptyText : 'R.I.F. de la Ensambladora',
						fieldLabel : 'Rif'
					}, {
						xtype : 'textfield',
						x : 310,
						y : 130,
						width : 270,
						id : 'telefono',
						msgTarget : 'under',
						blankText : 'Este campo es requerido',
						enableKeyEvents : true,
						minLength : 1,
						emptyText : 'Teléfono de la Ensambladora',
						fieldLabel : 'Teléfono'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 80,
						width : 410,
						id : 'nombre',
						msgTarget : 'under',
						blankText : 'Este campo es requerido',
						enableKeyEvents : true,
						minLength : 1,
						emptyText : 'Nombre de la Ensambladora',
						fieldLabel : 'Nombre'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 130,
						width : 280,
						id : 'correo',
						msgTarget : 'under',
						blankText : 'Este campo es requerido',
						enableKeyEvents : true,
						minLength : 1,
						emptyText : 'Correo de la Ensambladora',
						fieldLabel : 'Correo'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 240,
						width : 560,
						id : 'direccion',
						msgTarget : 'under',
						blankText : 'Este campo es requerido',
						enableKeyEvents : true,
						minLength : 1,
						emptyText : 'Dirección de la Ensambladora',
						fieldLabel : 'Dirección'
					}, {
						xtype : 'combobox',
						store : estadoStore,
						x : 20,
						y : 180,
						width : 280,
						id : 'cmb_estado',
						valueField : 'id',
						displayField : 'nombre',
						queryMode : 'remote',
						typeAhead : true,
						emptyText : 'Seleccionar',
						triggerAction : 'all',
						editable : 'false',
						selecOnFocus : true,
						fieldLabel : 'Estado',
						listeners : {
							scope : this,
							'select' : function(combo, rec) {
								var estado_val = rec[0].get(combo.valueField);
								// alert(estado_val);
								var ciudades_obj = Ext.getCmp('cmb_ciudad');
								if (primeravez) {
									primeravez = false;
									ciudades_obj.clearValue();
								} else {
									ciudades_obj.clearValue();
									ciudades_obj.getStore().clearFilter();
								}
								ciudades_obj.store.filter('estados_id', estado_val);
							}
						}
					}, {
						xtype : 'combobox',
						x : 310,
						y : 180,
						width : 270,
						id : 'cmb_ciudad',
						store : ciudadeStore,
						valueField : 'id',
						displayField : 'nombre',
						queryMode : 'remote',
						typeAhead : true,
						emptyText : 'Seleccionar',
						triggerActio : 'all',
						editable : 'false',
						selecOnFocus : true,
						fieldLabel : 'Ciudad'
					}, {
						xtype : 'combobox',
						x : 20,
						y : 290,
						width : 280,
						id : 'cmb_marca',
						store : marcaStore,
						valueField : 'id',
						displayField : 'nombre',
						queryMode : 'remote',
						typeAhead : true,
						emptyText : 'Seleccionar',
						triggerActio : 'all',
						editable : 'false',
						selecOnFocus : true,
						fieldLabel : 'Marca Asociada',
						// listeners: {
						// scope: this,
						// 'select': function(combo, rec) {
						// alert(rec[0].get(combo.displayField));
						// }
						// }
					}]
				}, {
					xtype : 'form',
					height : 340,
					layout : {
						type : 'absolute'
					},
					title : 'Datos del Usuario',
					items : [{
						xtype : 'textfield',
						x : 20,
						y : 30,
						width : 300,
						id : 'nombre_usuario',
						msgTarget : 'under',
						blankText : 'Este campo es requerido',
						enableKeyEvents : true,
						minLength : 1,
						emptyText : 'Login del usuario',
						fieldLabel : 'Nombre de Usuario'
					}, {
						xtype : 'label',
						x : 20,
						y : 90,
						height : 20,
						width : 110,
						id : 'rol_usuario',
						text : 'Rol del Usuario:'
					}, {
						xtype : 'label',
						x : 130,
						y : 90,
						height : 40,
						width : 160,
						id : 'ensamblador',
						text : 'Ensambladora'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 130,
						width : 300,
						id : 'contrasena',
						msgTarget : 'under',
						blankText : 'Este campo es requerido',
						enableKeyEvents : true,
						minLength : 1,
						emptyText : 'Contraseña del Usuario ',
						inputType : 'password',
						fieldLabel : 'Contraseña'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 180,
						width : 300,
						id : 'contrasena2',
						msgTarget : 'under',
						blankText : 'Este campo es requerido',
						enableKeyEvents : true,
						minLength : 1,
						emptyText : 'Contraseña del Usuario ',
						inputType : 'password',
						fieldLabel : 'Confirmar Contraseña'
					}, {
						xtype : 'button',
						x : 490,
						y : 260,
						text : 'Guardar',
						icon : 'images/grabar.png',
						tooltip : 'Registrar una Datos de la Ensambladora',
						id : 'btnregistrar',
					}, {
						xtype : 'button',
						x : 400,
						y : 260,
						text : 'Limpiar',
						icon : 'images/limpiar.png',
						tooltip : 'Limpiar Campos',
						id : 'btnlimpiar'
					}, {
						xtype : 'button',
						x : 300,
						y : 260,
						text : 'Eliminar',
						icon : 'images/eliminar.png',
						tooltip : 'Eliminar Ensambladora',
						id : 'btneliminar'
					}]
				}]
			}]
		});

		me.callParent(arguments);
	}
});

