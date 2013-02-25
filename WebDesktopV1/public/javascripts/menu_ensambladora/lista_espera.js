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

Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*',
				'Ext.container.Viewport',
    			'Ext.container.ButtonGroup',
    			'Ext.panel.Panel'
	         ]);

//Definicion del Modelo
 Ext.define('Compradores', {
    extend: 'Ext.data.Model',
    fields: [ 'cedula', 'posicion', 'vehiculo_comprado', 'concesionario']
});

//Definicion del Data Store
var compradoresStore = Ext.create('Ext.data.Store', {
    model: 'Compradores',
    data: [
        { cedula: '18923926', posicion : '1', vehiculo_comprado:'Nuvira', concesionario: 'DaewoCaro' },
        { cedula: '12345678', posicion : '3', vehiculo_comprado:'Cielo', concesionario: 'Daewocentro'},
        { cedula: '98765432', posicion : '5', vehiculo_comprado:'Matix', concesionario: 'DaewoYar'},
        { cedula: '19618874', posicion : '4', vehiculo_comprado:'Lomox', concesionario: 'Daewoconce'}

    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.CompradoresGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.compradoresgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 20, sortable: true},
            {text: "Cedula", width: 60, dataIndex: 'cedula', sortable: true},
            {text: "Posicion", width: 100, dataIndex: 'posicion', sortable: true},
            {text: "Vehiculo Comprado", width: 100, dataIndex: 'vehiculo_comprado', sortable: true},
            {text: "Concesionario", width: 100, dataIndex: 'concesionario', sortable: true},
        ];
        this.dockedItems = [ {
	  		xtype: 'pagingtoolbar',
                    dock: 'bottom',
                    width: 360,
                    displayInfo: true,
                    displayMsg : 'Personas en espera {0} - {1} de {2}',
	  	} ];
        // Origen de los datos, de un data store
        this.store = compradoresStore;
        this.forceFit = true;
	this.scroll = true;
	this.viewConfig = { style: {overflowY: 'hidden', overflowX: 'hidden' } };
	this.verticalScroller = {xtype: 'compradoresgrid'};
        this.listeners = {
                          itemclick : function(view) {
                           data = this.getSelectionModel().selected.items[0].data;
                           //alert('hadjasdha');
                             ventanatab = Ext.create('ventanatab');
                  			 ventanatab.show();
                  			 ventanalista.close();
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.CompradoresGrid.superclass.initComponent.call(this);
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
                                    fieldLabel: 'Cedula'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 60,
                                    disabled: true,
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 100,
                                    disabled: true,
                                    fieldLabel: 'Apellido'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 140,
                                    disabled: true,
                                    fieldLabel: 'Telefono'
                                },
                                {
                                    xtype: 'combobox',
                                    x: 70,
                                    y: 180,
                                    width: 310,
                                    disabled: true,
                                    fieldLabel: 'Sexo'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 220,
                                    disabled: true,
                                    fieldLabel: 'Dirección'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 260,
                                    disabled: true,
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
                                    fieldLabel: 'Matricula'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 60,
                                    disabled: true,
                                    fieldLabel: 'Costo'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 100,
                                    disabled: true,
                                    fieldLabel: 'Año'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 140,
                                    disabled: true,
                                    fieldLabel: 'Color'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 180,
                                    disabled: true,
                                    fieldLabel: 'Serial del Motor'
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
                                    fieldLabel: 'R.I.F.'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 60,
                                    disabled: true,
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 100,
                                    disabled: true,
                                    fieldLabel: 'Dirección'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 140,
                                    disabled: true,
                                    fieldLabel: 'Telefono'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 70,
                                    y: 180,
                                    disabled: true,
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
                x: 350,
                y: 30,
                width       : 650,
                height      : 575,
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
	                 			xtype:'compradoresgrid',
	                 			
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
