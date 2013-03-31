  //Calcular las posiciones x,y segun la resolucion del monitor del cliente para el tabpanel por ser un layout absolute
   var posx = 0;
   var posy = 0;
   var factorw = 0.001;
   var factorh = 0.10;
   //1024x768
   if (screen.width==1024 && screen.height==768)
   {
    factorw = 0.025;
    factorh = 0.10;
   }
   //1280x800
   if (screen.width==1280 && screen.height==800)
   {
    factorw = 0.080;
    factorh = 0.10;
   }
   //1280x1024
   if (screen.width==1280 && screen.height==1024)
   {
    factorw = 0.020;
    factorh = 0.005;
   }
posx = parseInt(screen.width * factorw);
posy = parseInt(screen.height * factorh);

var data = null;
var ventana = null;

Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*',
				'Ext.container.Viewport',
    			'Ext.container.ButtonGroup',
    			'Ext.panel.Panel'
	         ]);

//Definicion del Data model Concesionario
Ext.define('ListaColaGeneral', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'nombre', type: 'varchar'},
            {name: 'cedula', type: 'varchar'},
            {name: 'idcomprador', type: 'varchar'},
            {name: 'apellido', type: 'varchar'},
            {name: 'telefono_comp', type: 'varchar'},
            {name: 'direccion_comp', type: 'varchar'},
            {name: 'correo_comp', type: 'varchar'},
            {name: 'fechanacim_comp', type: 'varchar'},
            {name: 'imagen_usu', type: 'varchar'},
            {name: 'imagen_vehic', type: 'varchar'},
            {name: 'imagen_marca', type: 'varchar'},
            {name: 'posicion', type: 'string'},
            {name: 'fecha', type: 'string'},
            {name: 'validez', type: 'string'},
            {name: 'estatus', type: 'string'},
            {name: 'modelo', type: 'varchar'},
            {name: 'concesionario', type: 'varchar'},
            {name: 'rif_conce', type: 'varchar'},
            {name: 'direccion_conc', type: 'varchar'},
            {name: 'telefono_conc', type: 'varchar'},
            {name: 'correo_conc', type: 'varchar'},
            {name: 'marca', type: 'varchar'},
            {name: 'nombre_desc', type: 'string'},
            {name: 'ano_fabricacion', type: 'varchar'},
            {name: 'precio_venta', type: 'varchar'},
            {name: 'tipo_vehi', type: 'varchar'},
           ],
});

//Definicion del Data Store ListaColaGeneral
 listageneralStore = Ext.create('Ext.data.Store', {
    model: 'ListaColaGeneral',
    autoLoad: true,
    proxy: {
         type: 'ajax',
         url : 'menu_admin/generardataListaGlobal',
         reader: {
                  type: 'json',
                  root: 'datos'
              }
           }
});


//Definicion de la clase ConcesionarioGrid
Ext.define('App.ListaColaGeneralGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.listaColaGeneralgrid',
	height: 180,
    width: 638,
    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            // {xtype: 'rownumberer', width: 20, sortable: true},
            {text: "Nombre", width: 90, dataIndex: 'nombre', sortable: true},
            {text: "Posición", width: 60, dataIndex: 'posicion', sortable: true},
            {text: "Fecha de Solicitud", width: 100, dataIndex: 'fecha', sortable: true},
            {text: "Modelo Vehículo", width: 120, dataIndex: 'modelo', sortable: true},
            {text: "Concesionario", width: 120, dataIndex: 'concesionario', sortable: true},
            {text: "Marca", width: 100, dataIndex: 'marca', sortable: true},
        ];
        // this.dockedItems = [ {
	  		// xtype: 'pagingtoolbar',
                    // dock: 'bottom',
                    // width: 360,
                    // displayInfo: true,
                    // displayMsg : 'Personas en espera {0} - {1} de {2}',
	  	// } ];
        // Origen de los datos, de un data store
        this.store = listageneralStore;
        this.forceFit = true;
		this.scroll = true;
		this.viewConfig = { style: {overflowY: 'hidden', overflowX: 'hidden' } };
		this.verticalScroller = {xtype: 'listaColaGeneralgrid'};
        this.listeners = {
                          itemclick : function(view) {
                           data = this.getSelectionModel().selected.items[0].data;
                           asignarDatosComprador();
                           asignarDatosVehiculo();
                           asignarDatosConcesionarioLista();
                           asignarDatosProforma()
                           ventanatab = Ext.create('ventanatab');
                		   ventanatab.show();
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.ListaColaGeneralGrid.superclass.initComponent.call(this);
    }
});
//Definicion de Tab
Ext.define('ventanatab', {
    extend: 'Ext.tab.Panel',
	alias: 'widget.tabinform',
    x: 0,
    y: 175,
    height: 500,
    width: 650,
    activeTab: 0,

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'panel',
                    layout: {
                        type: 'absolute'
                    },
                    title: 'Comprador',
					items: [
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 20,
                                    disabled: true,
                                    id: 'cedula_comp',
                                    fieldLabel: 'Cedula'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 60,
                                    disabled: true,
                                    id: 'nombre_comp',
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 100,
                                    disabled: true,
                                    id: 'apellido_comp',
                                    fieldLabel: 'Apellido'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 140,
                                    disabled: true,
                                    id: 'telefono_comp',
                                    fieldLabel: 'Telefono'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 180,
                                    width: 310,
                                    disabled: true,
                                    id: 'fechanacimiento_comp',
                                    fieldLabel: 'Fecha de Nacimiento'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 220,
                                    disabled: true,
                                    id: 'direccion_comp',
                                    fieldLabel: 'Dirección'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 260,
                                    disabled: true,
                                    id: 'correo_comp',
                                    fieldLabel: 'Correo'
                                },
                                {
                                	x: 450,
                                	y: 50,
                                	height: 200,
    								width: 150,
                                	html:'<div align="left"><img src="images/silueta.jpg""></div>'
                                }
                            ]
                },
                {
                    xtype: 'panel',
                    layout: {
                        type: 'absolute'
                    },
                    title: 'Vehiculo',
                    items: [
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 20,
                                    disabled: true,
                                    id: 'nombre_modelo',
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 60,
                                    disabled: true,
                                    id: 'precio',
                                    fieldLabel: 'Precio'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 100,
                                    disabled: true,
                                    id: 'ano',
                                    fieldLabel: 'Año'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 140,
                                    disabled: true,
                                    id: 'tipo_vehiculo',
                                    fieldLabel: 'Tipo Vehículo'
                                },                                
                                {
                                	x: 400,
                                	y: 55,
                                	height: 200,
    								width: 250,
                                	html:'<div align="left"><img src="images/carrodaewood.jpg""></div>'
                                }
                            ]
                },
                {
                    xtype: 'panel',
                    layout: {
                        type: 'absolute'
                    },
                    title: 'Concesionario',
                    items: [
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 20,
                                    disabled: true,
                                    id: 'rif_conc',
                                    fieldLabel: 'R.I.F.'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 60,
                                    disabled: true,
                                    id: 'nombre_conc',
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 100,
                                    disabled: true,
                                    id: 'direccion_conc',
                                    fieldLabel: 'Dirección'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 140,
                                    disabled: true,
                                    id: 'telefono_conc',
                                    fieldLabel: 'Telefono'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 180,
                                    disabled: true,
                                    id: 'correo_conc',
                                    fieldLabel: 'Correo'
                                },
                                {
                                	x: 400,
                                	y: 50,
                                	height: 200,
    								width: 300,
                                	html:'<div align="left"><img src="images/Daewoo.jpg""></div>'
                                }
                                
                            ]
                },
                {
                    xtype: 'panel',
                    layout: {
                        type: 'absolute'
                    },
                    title: 'Proforma',
                    items: [
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 40,
                                    disabled: true,
                                    id: 'fecha',
                                    fieldLabel: 'Fecha de Solicitud:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 100,
                                    disabled: true,
                                    id: 'validez',
                                    fieldLabel: 'Fecha de Validez:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 160,
                                    disabled: true,
                                    id: 'estatus',
                                    fieldLabel: 'Estatus:'
                                }
                            ]
                }
            ]
        });

         me.callParent(arguments);
    }

});

//Definicion de la ventana contendora del grid
Ext.define('miVentanalista', {
    extend: 'Ext.window.Window',

                layout: 'fit',
                x: 440,
                y: 35,
                width       : 650,
                height      : 590,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                maximizable : false,
                minimizable : false,
                modal       : false,
                title       : 'Listados',
                buttonAlign : 'center',
                constrain   : true,
        		collapsible: true,
        	    renderTo: 'tree_el', 
        	    initComponent: function() {
        			var me = this;  
        	    	Ext.applyIf(me, {
          			items: [
		                {
		                	xtype: 'panel',
		                	width: 350,
               				height: 500,
		                    frameHeader: true,
		                    collapsible: true,
		                    layout: {
                                type: 'absolute'
                            },
                    		header: true,
                    		title: 'Lista de espera en la Cola',
                    		items: [
	                    		{ 
	                 			xtype:'listaColaGeneralgrid',
	                 			
	                 			viewConfig: {
	                    		   }
	                 		    },
			                    {
				                  xtype:'tabinform',
				                 	viewConfig: {
			                    		}
				                },
                    		]
		                 },    		          		    
                ],
                   });

        me.callParent(arguments);
    }
   });
   
  
   //Metodo para buscar y mostrar datos del comprador de vehiculo
   function buscar_CompradorVehiculo() {
   //	alert('metodo buscar comprado');
			Ext.Ajax.request({
				url : 'menu_admin/buscar_CompradorVehiculo',
				params : {
					ajax : 'true',
					funcion : 'buscar_CompradorVehiculo',
					idcomprador : idcomprador,
				},
				//Retorno exitoso de la pagina servidora a traves del formato JSON
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito.responseText);
					if (datos.exito == 'false') {
						Ext.Msg.alert("Error", datos.msg);
					} else {
						alert(datos.cedula);
						Ext.getCmp('cedula_comp').setValue(datos.cedula);
					}
				},
				//No hay retorno de la pagina servidora
				failure : function() {
					Ext.Msg.alert("Error", "Servidor no conectado");

				}
			});
}; 

function asignarDatosComprador () {
  Ext.getCmp('cedula_comp').setValue(data.cedula);
  Ext.getCmp('nombre_comp').setValue(data.nombre);
  Ext.getCmp('apellido_comp').setValue(data.apellido);
  Ext.getCmp('direccion_comp').setValue(data.direccion_comp);
  Ext.getCmp('telefono_comp').setValue(data.telefono_comp);
  Ext.getCmp('correo_comp').setValue(data.correo_comp);
  Ext.getCmp('fechanacimiento_comp').setValue(data.fechanacim_comp);
};

function asignarDatosVehiculo () {
  Ext.getCmp('nombre_modelo').setValue(data.nombre_desc);
  Ext.getCmp('ano').setValue(data.ano_fabricacion);
  Ext.getCmp('precio').setValue(data.precio_venta);
  Ext.getCmp('tipo_vehiculo').setValue(data.tipo_vehi);
};

function asignarDatosConcesionarioLista () {
  Ext.getCmp('rif_conc').setValue(data.rif_conce);
  Ext.getCmp('nombre_conc').setValue(data.concesionario);
  Ext.getCmp('direccion_conc').setValue(data.direccion_conc);
  Ext.getCmp('telefono_conc').setValue(data.telefono_conc);
  Ext.getCmp('correo_conc').setValue(data.correo_conc);
};

function asignarDatosProforma () {
  Ext.getCmp('fecha').setValue(data.fecha);
  Ext.getCmp('validez').setValue(data.validez);
  Ext.getCmp('estatus').setValue(data.estatus);
};