var id_responsable = null;

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

//Definicion del Modelo Responsable
Ext.define('Responsables', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'id_responsable',
		type : 'int'
	}, {
		name : 'nombre',
		type : 'varchar'
	}, {
		name : 'correo',
		type : 'varchar'
	}, {
		name : 'telefono',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'concesionario/generardatacomboresponsables'
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

//Definicion del Data Store del Responsable
var responsableStore = Ext.create('Ext.data.Store', {
	model : 'Responsables',
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
                    id: 'formularioindicadores',
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
				                      //alert(rec[0].get(combo.valueField)); 
				                      valoridmarca =rec[0].get(combo.valueField);
				                      //alert(valoridmarca); 
				                 }
				            }
                        },
                        {
                            xtype: 'combobox',
                            x: 360,
                            y: 80,
                            fieldLabel: 'Unidad de la Meta',
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
				                      //alert(rec[0].get(combo.valueField)); 
				                      valoridmarca =rec[0].get(combo.valueField);
				                      //alert(valoridmarca); 
				                 }
				            }
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 80,
                            fieldLabel: 'Valor de la Meta',
                            id: 'valormeta'
                        },
                        {
                            xtype: 'datefield',
                            x: 680,
                            y: 80,
                            width: 290,
                            fieldLabel: 'Fecha de la Meta',
                            id: 'fechameta'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 130,
                            fieldLabel: 'Valor Amarillo',
                            id:'valoramarillo'
                        },
                        {
                            xtype: 'datefield',
                            x: 360,
                            y: 130,
                            width: 290,
                            fieldLabel: 'Fecha Amarillo',
                            id: 'fechaamarillo'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 180,
                            fieldLabel: 'Valor Rojo',
                            id: 'valorrojo'
                        },
                        {
                            xtype: 'datefield',
                            x: 360,
                            y: 180,
                            width: 290,
                            fieldLabel: 'Fecha Rojo',
                            id: 'fecharojo'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 230,
                            fieldLabel: 'Valor Verde',
                            id: 'valorverde'
                        },
                        {
                            xtype: 'datefield',
                            x: 360,
                            y: 230,
                            width: 290,
                            fieldLabel: 'Fecha Verde',
                            id: 'fechaverde'
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
				                      //alert(rec[0].get(combo.valueField)); 
				                      valoridmarca =rec[0].get(combo.valueField);
				                      //alert(valoridmarca); 
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
				                      //alert(rec[0].get(combo.valueField)); 
				                      valoridmarca =rec[0].get(combo.valueField);
				                      //alert(valoridmarca); 
				                 }
				            }
                        },
                        {
                            xtype: 'combobox',
                            x: 20,
                            y: 330,
                            fieldLabel: 'Responsable',
							id : 'cmb_responsable',
							store : responsableStore,
							valueField : 'id_responsable',
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
				                      id_responsable =rec[0].get(combo.valueField);
				                      buscarUsuarioResponsable();
				                 }
				            }
                        },
                        {
                            xtype: 'textfield',
                            x: 360,
                            y: 330,
                            fieldLabel: 'Correo del Responsable',
                            id: 'correorespponsable',
                            disabled: true
                        },
                        {
                            xtype: 'textfield',
                            x: 670,
                            y: 330,
                            fieldLabel: 'Telefono',
                            id: 'telefono',
                            disabled: true
                        },
                        {
                            xtype: 'button',
                            x: 800,
                            y: 375,
                            icon : 'images/grabar.png',
                            text: 'Guardar la Configuracion',
                            listeners : {
								click : function() {
									//alert('PASO');
                            		buscarUsuarioIndicador();
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

function buscarUsuarioIndicador () {
	Ext.Ajax.request({
		   url: 'concesionario/buscarUsuarioIndi',    
		     //Enviando los parametros a la pagina servidora
		   params: {
		   		nombre: document.getElementById("user_name").textContent,
		   },
		     //Retorno exitoso de la pagina servidora a traves del formato JSON
		   success: function( resultado, request ) {
		      datos=Ext.JSON.decode(resultado.responseText);
		      if (datos.exito=='false') {
		      	Ext.Msg.alert("Error", 'No encontro');
		      } else{
		      	//alert(datos.id);
				var id_usuario = datos.id;
				guardarconfiguracion(id_usuario);
				var rols_id = datos.rols_id;
				//alert('Busco Id del Usuario');
				//Ext.Msg.alert("Exito", datos.msg); 
		      };
		   },
		     //No hay retorno de la pagina servidora
		   failure: function() {
		      Ext.Msg.alert("Error", "Servidor no conectado!AQUI");
		   }
	});
}
function guardarconfiguracion (id_usuario) {
	//alert('Entrando a guardar la configuracion');
	Ext.Ajax.request({
		   url: 'concesionario/guardarConfiguracionIndicador',    
		     //Enviando los parametros a la pagina servidora
		   params: {
		      usuarios_id: id_usuario,
		      indicadors_id: Ext.getCmp('cmb_indicador').getValue(),
		      valor_meta: Ext.getCmp('valormeta').getValue(),
		      unidads_id: Ext.getCmp('cmb_unidad').getValue(),
		      fecha_meta: Ext.getCmp('fechameta').getValue(),
		      valor_amarillo: Ext.getCmp('valoramarillo').getValue(),
		      valor_rojo: Ext.getCmp('valorrojo').getValue(),
		      valor_verde: Ext.getCmp('valorverde').getValue(),
		      fecha_amarillo: Ext.getCmp('fechaamarillo').getValue(),
		      fecha_rojo: Ext.getCmp('fecharojo').getValue(),
		      fecha_verde: Ext.getCmp('fechaverde').getValue(),
		      estados_indicadors_id: Ext.getCmp('cmb_estadoindi').getValue(),
		      responsable: Ext.getCmp('cmb_responsable').getValue(),
		      frecuencia_notificacions_id: Ext.getCmp('cmb_frecuencia').getValue(),
		      
		   },
		     //Retorno exitoso de la pagina servidora a traves del formato JSON
		   success: function( resultado, request ) {
		      datos=Ext.JSON.decode(resultado.responseText);
		      Ext.getCmp('formularioindicadores').getForm().reset(),
		      Ext.Msg.alert("Exito", datos.message);
		   },
		     //No hay retorno de la pagina servidora
		   failure: function() {
		      Ext.Msg.alert("Error", "Servidor no conectado!AQUI");
		   }
		}); 
}

function buscarUsuarioResponsable() {
	Ext.Ajax.request({
		   url: 'concesionario/buscarResponsable',    
		     //Enviando los parametros a la pagina servidora
		   params: {
		   		id_responsable: id_responsable,
		   },
		     //Retorno exitoso de la pagina servidora a traves del formato JSON
		   success: function( resultado, request ) {
		      datos=Ext.JSON.decode(resultado.responseText);
		      if (datos.exito=='false') {
		      	Ext.Msg.alert("Error", 'No encontro');
		      } else{
				Ext.getCmp('correorespponsable').setValue(datos.correo);
				Ext.getCmp('telefono').setValue(datos.telefono);
		      };
		   },
		     //No hay retorno de la pagina servidora
		   failure: function() {
		      Ext.Msg.alert("Error", "Servidor no conectado!AQUI");
		   }
	});
}