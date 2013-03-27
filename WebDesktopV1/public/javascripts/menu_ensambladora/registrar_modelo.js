Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup', 'Ext.panel.Panel']);
nombre_id=null;
marca_id=null;
//Definicion del Modelo Tipos de Vehiculos 
Ext.define('Tipos', {
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
		url : 'menu_admin/generardatacombostipos'
	}
});

//Definicion del Data Store de Tipos
var tipoStore = Ext.create('Ext.data.Store', {
	model : 'Tipos',
	autoLoad : true,
});

Ext.define('miVentanaModelo', {
    extend: 'Ext.window.Window',

    height: 420,
    width: 559,
    layout: {
        type: 'absolute'
    },
    title: 'Registrar Vehiculo Modelo',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'tabpanel',
                    x: -2,
                    y: 0,
                    height: 380,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            height: 283,
                            title: 'Modelo Vehículo',
                            items: [
                                {
                                    xtype: 'form',
                                    id : 'formularioModelo',
                                    height: 359,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    bodyPadding: 10,
                                    title: '',
                                    items: [
                                        {
                                            xtype: 'textareafield',
                                            x: 60,
                                            y: 20,
                                            width: 400,
                                            fieldLabel: 'Descripción',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Descripción general del modelo del vehículo',
                                            id: 'descripcion'
                                        },{
                                            xtype: 'textfield',
                                            x: 60,
                                            y: 100,
                                            width: 270,
                                            fieldLabel: 'Año del Modelo',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Año de fabricación',
                                            id: 'ano'
                                        },{
                                            xtype : 'combobox',
											x: 60,
                                            y: 130,
											 width: 270,
											id : 'cmb_tipo',
											store : tipoStore,
											valueField : 'id',
											displayField : 'nombre',
											queryMode : 'remote',
											typeAhead : true,
											emptyText : 'Seleccionar',
											triggerActio : 'all',
											editable : 'false',
											fieldLabel: 'Tipo de Vehiculo:',
											selecOnFocus : true,
											listeners: {
								                 scope: this,
								                'select': function(combo, rec) {
								                      alert(rec[0].get(combo.valueField)); 
								                      valorid =rec[0].get(combo.valueField);
								                      alert(valorid); 
								                 }
								            }
                                        },{
                                            xtype: 'filefield',
                                            x: 60,
                                            y: 180,
                                            width: 450,
                                            id: 'imagen1',
                                            fieldLabel: 'Imagen Modelo:',
                                            name: 'photo-path',
		            						buttonText: 'Seleccionar Archivo',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Imagen de Presetación 1'
                                        },{
                                            xtype: 'filefield',
                                            x: 60,
                                            y: 230,
                                            width: 450,
                                            id: 'imagen2',
                                            fieldLabel: 'Imagen Modelo:',
                                            name: 'photo-path',
		           							buttonText: 'Seleccionar Archivo',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Imagen de Presetación 2'
                                        }
                                    ]
                                }
                            ]
                       }]
                },{
                    xtype: 'button',
                    x: 240,
                    y: 330,
                    icon : 'images/eliminar.png',
					tooltip : 'Eliminar Modelo',
					id : 'btncancelar',
					id : 'btneliminar',
                    text: 'Eliminar'
                },{
                    xtype: 'button',
                    x: 340,
                    y: 330,
                    icon : 'images/limpiar.png',
                    text: 'Limpiar',
                    listeners : {
						click : function() {
							Ext.getCmp('formularioModelo').getForm().reset();
						}
					}
                },{
                    xtype: 'button',
                    x: 440,
                    y: 330,
                    icon : 'images/grabar.png',
					tooltip : 'Registrar una Marca',
					id : 'btnregistrar',
                    text: 'Guardar',
                    listeners : {
						click : function() {
							buscarUsuario();
							//buscarEnsambladora_marca();			
							//guardarModeloVehiculo();
						}
					}
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
		      	marca_id=datos.marcas_id;
		      	guardarModeloVehiculo();
		      	Ext.Msg.alert("Exito",'Encontro');
		      };
		   },
		     //No hay retorno de la pagina servidora
		   failure: function() {
		      Ext.Msg.alert("Error", "Servidor no conectado!AQUI");
		   }
	});
}


function guardarModeloVehiculo() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/grabarModeloVehiculo',
		params : {
			ajax : 'true',
			funcion : 'grabarModeloVehiculo',
			descripcion : Ext.getCmp('descripcion').getValue(),
			ano : Ext.getCmp('ano').getValue(),
			marca :marca_id ,
			tipo : Ext.getCmp('cmb_tipo').getValue(),
			imagen1 : Ext.getCmp('imagen1').getValue(),
			imagen2 : Ext.getCmp('imagen2').getValue(),
		},
		success : function(exito, request) {
			Ext.Msg.alert("Exito", "Se ha Guardado elModelo del Vehiculo!!");
			Ext.getCmp('formularioModelo').getForm().reset();
			
		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	}); 
}