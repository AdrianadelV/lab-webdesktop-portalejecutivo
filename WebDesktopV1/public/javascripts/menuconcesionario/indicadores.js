Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup', 'Ext.panel.Panel']);

//Definicion del Modelo Indicadores
Ext.define('Indicadores', {
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
		url : 'concesionario/generardatacombosindicadores'
	}
});

//Definicion del Modelo Unidades
Ext.define('Unidades', {
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
		url : 'concesionario/generardatacombosunidades'
	}
});

//Definicion del Modelo Estado del indicador
Ext.define('EstadoMo', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'id_estado',
		type : 'int'
	}, {
		name : 'nombre',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'concesionario/generardatacombosestadosindicador'
	}
});

//Definicion del Modelo Frecuencia
Ext.define('Frecuencia', {
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
		url : 'concesionario/generardatacombosfrecuencia'
	}
});

//Definicion del Data Store de Estado del indicador
var estadoMoStore = Ext.create('Ext.data.Store', {
	model : 'EstadoMo',
	autoLoad : true,
});

//Definicion del Data Store Frecuencia
var frecuenciaStore = Ext.create('Ext.data.Store', {
	model : 'Frecuencia',
	autoLoad : true,
});

//Definicion del Data Store de Unidades
var unidadesStore = Ext.create('Ext.data.Store', {
	model : 'Unidades',
	autoLoad : true,
});

//Definicion del Data Store de Indicadores
var indicadoresStore = Ext.create('Ext.data.Store', {
	model : 'Indicadores',
	autoLoad : true,
});

Ext.define('miVentanaIndicadores', {
    extend: 'Ext.window.Window',

    height: 450,
    width: 990,
    layout: {
        type: 'absolute'
    },
    title: 'Configurar Indicador',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    x: 0,
                    y: -1,
                    height: 450,
                    width: 990,
                    layout: {
                        type: 'absolute'
                    },
                    bodyPadding: 10,
                    title: '',
                    items: [
                        {
                            xtype: 'combobox',
                            x: 20,
                            y: 20,
                            width: 480,
                            fieldLabel: 'Indicador',
							id : 'cmb_indicador',
							store : indicadoresStore,
							valueField : 'id',
							displayField : 'nombre',
							queryMode : 'remote',
							typeAhead : true,
							emptyText : 'Seleccionar',
							triggerActio : 'all',
							editable : 'false',
							selecOnFocus : true,
							listeners: {
				                 scope: this,
				                'select': function(combo, rec) {
				                      alert(rec[0].get(combo.valueField)); 
				                      valoridmarca =rec[0].get(combo.valueField);
				                      alert(valoridmarca); 
				                 }
				            }
                        },
                        {
                            xtype: 'combobox',
                            x: 360,
                            y: 80,
                            fieldLabel: 'Unidad',
							id : 'cmb_unidad',
							store : unidadesStore,
							valueField : 'id',
							displayField : 'nombre',
							queryMode : 'remote',
							typeAhead : true,
							emptyText : 'Seleccionar',
							triggerActio : 'all',
							editable : 'false',
							selecOnFocus : true,
							listeners: {
				                 scope: this,
				                'select': function(combo, rec) {
				                      alert(rec[0].get(combo.valueField)); 
				                      valoridmarca =rec[0].get(combo.valueField);
				                      alert(valoridmarca); 
				                 }
				            }
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 80,
                            fieldLabel: 'Valor de la Meta'
                        },
                        {
                            xtype: 'datefield',
                            x: 680,
                            y: 80,
                            width: 290,
                            fieldLabel: 'Fecha de la Meta'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 130,
                            fieldLabel: 'Valor Amarillo'
                        },
                        {
                            xtype: 'datefield',
                            x: 360,
                            y: 130,
                            width: 290,
                            fieldLabel: 'Fecha Amarillo'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 180,
                            fieldLabel: 'Valor Rojo'
                        },
                        {
                            xtype: 'datefield',
                            x: 360,
                            y: 180,
                            width: 290,
                            fieldLabel: 'Fecha Rojo'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 230,
                            fieldLabel: 'Valor Verde'
                        },
                        {
                            xtype: 'datefield',
                            x: 360,
                            y: 230,
                            width: 290,
                            fieldLabel: 'Fecha Verde'
                        },
                        {
                            xtype: 'combobox',
                            x: 20,
                            y: 280,
                            fieldLabel: 'Estado del Indicador',
							id : 'cmb_estadoindi',
							store : estadoMoStore,
							valueField : 'id_estado',
							displayField : 'nombre',
							queryMode : 'remote',
							typeAhead : true,
							emptyText : 'Seleccionar',
							triggerActio : 'all',
							editable : 'false',
							selecOnFocus : true,
							listeners: {
				                 scope: this,
				                'select': function(combo, rec) {
				                      alert(rec[0].get(combo.valueField)); 
				                      valoridmarca =rec[0].get(combo.valueField);
				                      alert(valoridmarca); 
				                 }
				            }
                        },
                        {
                            xtype: 'combobox',
                            x: 360,
                            y: 280,
                            width: 300,
                            fieldLabel: 'Frecuencia de la Notificacion',
							id : 'cmb_frecuencia',
							store : frecuenciaStore,
							valueField : 'id',
							displayField : 'nombre',
							queryMode : 'remote',
							typeAhead : true,
							emptyText : 'Seleccionar',
							triggerActio : 'all',
							editable : 'false',
							selecOnFocus : true,
							listeners: {
				                 scope: this,
				                'select': function(combo, rec) {
				                      alert(rec[0].get(combo.valueField)); 
				                      valoridmarca =rec[0].get(combo.valueField);
				                      alert(valoridmarca); 
				                 }
				            }
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 330,
                            fieldLabel: 'Responsable'
                        },
                        {
                            xtype: 'textfield',
                            x: 360,
                            y: 330,
                            fieldLabel: 'Correo del Responsable'
                        },
                        {
                            xtype: 'textfield',
                            x: 670,
                            y: 330,
                            fieldLabel: 'Telefono'
                        },
                        {
                            xtype: 'button',
                            x: 800,
                            y: 375,
                            text: 'Guardar la Configuracion'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});