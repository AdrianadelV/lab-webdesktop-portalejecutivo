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
var boton = null;
var idestado_ensa= null;

Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*',
				'Ext.container.Viewport',
    			'Ext.container.ButtonGroup',
    			'Ext.panel.Panel'
	         ]);

//Definicion del Data model Ensambladora
Ext.define('Ensambladora', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id_ensam', type: 'int'},
            {name: 'rif_ensam', type: 'varchar'},
            {name: 'nombre_ensam', type: 'varchar'},
            {name: 'direccion_ensam', type: 'varchar'},
            {name: 'telefono_ensam', type: 'varchar'},
            {name: 'correo_ensam', type: 'varchar'},
            {name: 'ciudads_id_ensam', type: 'varchar'},
            {name: 'usuarios_id_ensam', type: 'int'},
            {name: 'marcas_id_ensam', type: 'int'},
           ],
});

//Definicion del Data Store Ensambladora
 ensambladoraStore = Ext.create('Ext.data.Store', {
    model: 'Ensambladora',
    autoLoad: true,
    proxy: {
         type: 'ajax',
         url : 'menu_admin/generardatalistaEnsambladora',
         reader: {
                  type: 'json',
                  root: 'datos'
              }
           }
});


//Definicion de la clase UsuariosGrid
Ext.define('App.EnsambladoraGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.ensambladoragrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 20, sortable: true},
            {text: "Rif", width: 60, dataIndex: 'rif_ensam', sortable: true},
            {text: "Nombre", width: 100, dataIndex: 'nombre_ensam', sortable: true},
            {text: "Dirección", width: 100, dataIndex: 'direccion_ensam', sortable: true},
            {text: "Telefono", width: 100, dataIndex: 'telefono_ensam', sortable: true},
            {text: "Correo", width: 100, dataIndex: 'correo_ensam', sortable: true},
        ];
        // this.dockedItems = [ {
	  		// xtype: 'pagingtoolbar',
                    // dock: 'bottom',
                    // width: 360,
                    // displayInfo: true,
                    // displayMsg : 'Personas en espera {0} - {1} de {2}',
	  	// } ];
        // Origen de los datos, de un data store
        this.store = ensambladoraStore;
        this.forceFit = true;
	this.scroll = true;
	this.viewConfig = { style: {overflowY: 'hidden', overflowX: 'hidden' } };
	this.verticalScroller = {xtype: 'ensambladoragrid'};
        this.listeners = {
                          itemclick : function(view) {
                           data = this.getSelectionModel().selected.items[0].data;
                  			 asignarDatosEnsambladora();
                           	 buscar_nombreCiudadEnsa();
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.EnsambladoraGrid.superclass.initComponent.call(this);
    }
});

Ext.define('ventanatabensambladoragrid', {
    extend: 'Ext.tab.Panel',
	alias: 'widget.tabinformensambladoragrid',
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
                    title: 'Ensambladora',
					items: [
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 20,
                                    id: 'rif_ensa',
                                    disabled: true,
                                    fieldLabel: 'Rif:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 60,
                                    id: 'nombre_ensa',
                                    disabled: true,
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 100,
                                    id: 'direccion_ensa',
                                    disabled: true,
                                    fieldLabel: 'Dirección'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 140,
                                    id: 'telefono_ensa',
                                    disabled: true,
                                    fieldLabel: 'Telefono'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 180,
                                    id: 'correo_ensa',
                                    width: 310,
                                    disabled: true,
                                    fieldLabel: 'Correo'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 220,
                                    id: 'ciudad_ensa',
                                    disabled: true,
                                    fieldLabel: 'Ciudad'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 260,
                                    id: 'estado_ensa',
                                    disabled: true,
                                    fieldLabel: 'Estado'
                                }
                            ]
                }
            ]
        });

         me.callParent(arguments);
    }

});

//Definicion de la ventana contendora del grid
Ext.define('miVentanalistaEnsambladora', {
    extend: 'Ext.window.Window',

                layout: 'fit',
                x: 350,
                y: 30,
                width       : 650,
                height      : 600,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                maximizable : false,
                minimizable : false,
                modal       : false,
                title       : 'Listados de Ensambladora',
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
                    		title: 'Lista de Ensambladora',
                    		items: [
	                    		{ 
	                 			xtype:'ensambladoragrid',
	                 			
	                 			viewConfig: {
	                    		   }
	                 		    },
	                 		    {
				                  xtype:'tabinformensambladoragrid',
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
   //Metodo para buscar y mostrar el nombre de la ciudad
   function buscar_nombreCiudadEnsa() {
			Ext.Ajax.request({
				url : 'menu_admin/buscar_nombreCiudad',
				params : {
					ajax : 'true',
					funcion : 'buscar_nombreCiudad',
					idciudad : data.ciudads_id_ensam,
				},
				//Retorno exitoso de la pagina servidora a traves del formato JSON
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito.responseText);
					if (datos.exito == 'false') {
						Ext.Msg.alert("Error", datos.msg);
					} else {
						Ext.getCmp('ciudad_ensa').setValue(datos.nombre);
						idestado_ensa = datos.estados_id;
						buscar_nombreEstadoEnsa();
					}
				},
				//No hay retorno de la pagina servidora
				failure : function() {
					Ext.Msg.alert("Error", "Servidor no conectado");

				}
			});
};  

//Metodo para buscar y mostrar el nombre del estado
   function buscar_nombreEstadoEnsa() {
			Ext.Ajax.request({
				url : 'menu_admin/buscar_nombreEstado',
				params : {
					ajax : 'true',
					funcion : 'buscar_nombreEstado',
					id_estado : idestado_ensa,
				},
				//Retorno exitoso de la pagina servidora a traves del formato JSON
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito.responseText);
					if (datos.exito == 'false') {
						Ext.Msg.alert("Error", datos.msg);
					} else {
						Ext.getCmp('estado_ensa').setValue(datos.nombre);
					}
				},
				//No hay retorno de la pagina servidora
				failure : function() {
					Ext.Msg.alert("Error", "Servidor no conectado");
				}
			});
}; 

function asignarDatosEnsambladora () {
  Ext.getCmp('rif_ensa').setValue(data.rif_ensam);
  Ext.getCmp('nombre_ensa').setValue(data.nombre_ensam);
  Ext.getCmp('direccion_ensa').setValue(data.direccion_ensam);
  Ext.getCmp('telefono_ensa').setValue(data.telefono_ensam);
  Ext.getCmp('correo_ensa').setValue(data.correo_ensam);
};
