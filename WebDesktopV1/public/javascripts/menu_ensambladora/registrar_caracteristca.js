Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup', 'Ext.panel.Panel']);
nombre_id=null;
ensambladora_id=null;
//Definicion del Modelo de Modelo de Vehiculos 
Ext.define('Modelos', {
	extend : 'Ext.data.Model',
	fields : [{
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

//Definicion del Modelo Caracteristica
Ext.define('Caracteristicas', {
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
		url : 'menu_admin/generardatacomboscaracteristicas'
	}
});

//Definicion del Data Store de la Caracteristicas
var caracteristicaStore = Ext.create('Ext.data.Store', {
	model : 'Caracteristicas',
	autoLoad : true,
});

//Definicion del Data Store de los Modelos de Vehiculos
var modelosStore = Ext.create('Ext.data.Store', {
	model : 'Modelos',
	autoLoad : true,
});

Ext.define('miVentanaCaracteristica', {
    extend: 'Ext.window.Window',

    height: 247,
    width: 436,
    title: 'Registrar Caracteristicas del Modelo',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                      id : 'formularioCaracteristica',
                    height: 205,
                    layout: {
                        type: 'absolute'
                    },
                    bodyPadding: 10,
                    title: '',
                    items: [
                        {
                            xtype: 'combobox',
                            x: 30,
                            y: 20,
                            width: 360,
                        	id : 'cmb_modelo',
							store : modelosStore,
							valueField : 'id',
							displayField : 'descripcion',
							queryMode : 'remote',
							typeAhead : true,
							emptyText : 'Seleccionar',
							triggerActio : 'all',
							editable : 'false',
							fieldLabel: 'Modelo del Vehículo:',
							selecOnFocus : true,
							listeners: {
				                 scope: this,
				                'select': function(combo, rec) {
				                      alert(rec[0].get(combo.valueField)); 
				                      valorid =rec[0].get(combo.valueField);
				                      alert(valorid); 
				                 }
				            }
                        },
                        {
                            xtype: 'combobox',
                            x: 30,
                            y: 80,
                            width: 360,
                            id: 'cmb_caracteristica',
							store : caracteristicaStore,
							valueField : 'id',
							displayField : 'valor',
							queryMode : 'remote',
							typeAhead : true,
							emptyText : 'Seleccionar',
							triggerActio : 'all',
							editable : 'false',
							fieldLabel: 'Caracteristica Asociada:',
							selecOnFocus : true,
							listeners: {
				                 scope: this,
				                'select': function(combo, rec) {
				                      alert(rec[0].get(combo.valueField)); 
				                      valorid =rec[0].get(combo.valueField);
				                      alert(valorid); 
				                 }
				            }
                        },
                        {
                            xtype: 'button',
                            x: 310,
                            y: 150,
                            text: 'Registrar',
                            listeners : {
								click : function() {
									buscarUsuario();
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

function buscarUsuario() {
	Ext.Ajax.request({
		   url: 'menu_ensambladora/buscar_usuario',    
		     //Enviando los parametros a la pagina servidora
		   params: {
		      nombre: document.getElementById("user_name").textContent,
		   },
		     //Retorno exitoso de la pagina servidora a traves del formato JSON
		   success: function( resultado, request ) {
		      datos=Ext.JSON.decode(resultado.responseText);
		      if (datos.exito=='false') {
		      	 Ext.Msg.alert("Error", datos.msg);
		      } else{
		      	nombre_id=datos.id;
		      	buscarEnsambladora_marca();
		      	Ext.Msg.alert("Exito",'Encontro');
		      };
		   },
		     //No hay retorno de la pagina servidora
		   failure: function() {
		      Ext.Msg.alert("Error", "Servidor no conectado!AQUI");
		   }
		});
}
function buscarEnsambladora_marca () {
  	Ext.Ajax.request({
		   url: 'menu_ensambladora/buscar_ensambladora_marca',    
		     //Enviando los parametros a la pagina servidora
		   params: {
		      usuarios_id:nombre_id,
		   },
		     //Retorno exitoso de la pagina servidora a traves del formato JSON
		   success: function( resultado, request ) {
		      datos=Ext.JSON.decode(resultado.responseText);
		      if (datos.exito=='false') {
		      	 Ext.Msg.alert("Error", datos.msg);
		      } else{
		      	ensambladora_id=datos.id;
		      	guardarCaracteristicaModelo();
		      	Ext.Msg.alert("Exito",'Encontro');
		      };
		   },
		     //No hay retorno de la pagina servidora
		   failure: function() {
		      Ext.Msg.alert("Error", "Servidor no conectado!AQUI");
		   }
	});
}

function guardarCaracteristicaModelo () {
	Ext.Ajax.request({
		url : 'menu_ensambladora/guardar_caracteristica',
		params : {
			ajax : 'true',
			funcion : 'guardar_caracteristica',
			modelo_vehiculos_id : Ext.getCmp('cmb_modelo').getValue(),
			caracteristicas_id : Ext.getCmp('cmb_caracteristica').getValue(),
			id_ensambladora :ensambladora_id ,	
		},
		success : function(exito, request) {
			Ext.Msg.alert("Exito", "Se ha Guardado la Caracteristica");
			Ext.getCmp('formularioCaracteristica').getForm().reset();
			
		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	}); 
}