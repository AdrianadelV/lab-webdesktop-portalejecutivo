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


//Definicion del Data model Concesionario
Ext.define('Concesionarios', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'int'},
            {name: 'rif', type: 'varchar'},
            {name: 'nombre', type: 'varchar'},
            {name: 'direccion', type: 'varchar'},
            {name: 'telefono', type: 'varchar'},
            {name: 'correo', type: 'varchar'},
            {name: 'latitud', type: 'varchar'},
            {name: 'longitud', type: 'varchar'},
            {name: 'ciudads_id', type: 'varchar'},
            {name: 'usuarios_id', type: 'int'},
            {name: 'marcas_id', type: 'int'},
           ],
});

//Definicion del Data Store Concesionarios
 concesionarioStore = Ext.create('Ext.data.Store', {
    model: 'Concesionarios',
    autoLoad: true,
    proxy: {
         type: 'ajax',
         url : 'menu_admin/generardatalistaConcesionarios',
         reader: {
                  type: 'json',
                  root: 'datos'
              }
           }
});


// 
// //Definicion del Modelo
 // Ext.define('Concesionario', {
    // extend: 'Ext.data.Model',
    // fields: [ 'marca', 'concesionario', 'estado', 'ciudad']
// });
// 
// //Definicion del Data Store
// var concesionarioStore = Ext.create('Ext.data.Store', {
    // model: 'Concesionario',
    // data: [
        // { marca: 'Ford', concesionario : 'FordCard', estado:'Lara', ciudad: 'Barquisimeto' },
        // { marca: 'Fiat', concesionario : 'FiatCard', estado:'Yaracuy', ciudad: 'San Felipe' },
        // { marca: 'Chevrolet', concesionario : 'ChevyCard', estado:'Lara', ciudad: 'Quibor' },
        // { marca: 'Huyndai', concesionario : 'HuyndaiCard', estado:'Carabobo', ciudad: 'Valencia' },
        // { marca: 'Daewood', concesionario : 'DaewoodCard', estado:'Lara', ciudad: 'Barquisimeto' },
// 
    // ]
// });

//Definicion de la clase ConcesionariosGrid
Ext.define('App.ConcesionarioGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.concesionariogrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 20, sortable: true},
            {text: "Rif", width: 60, dataIndex: 'rif', sortable: true},
            {text: "Nombre", width: 100, dataIndex: 'nombre', sortable: true},
            {text: "Dirección", width: 100, dataIndex: 'direccion', sortable: true},
            {text: "Telefono", width: 100, dataIndex: 'telefono', sortable: true},
            {text: "Correo", width: 100, dataIndex: 'correo', sortable: true},
        ];
        // this.dockedItems = [ {
	  		// xtype: 'pagingtoolbar',
                    // dock: 'bottom',
                    // width: 360,
                    // displayInfo: true,
                    // displayMsg : 'Personas en espera {0} - {1} de {2}',
	  	// } ];
        // Origen de los datos, de un data store
        this.store = concesionarioStore;
        this.forceFit = true;
	this.scroll = true;
	this.viewConfig = { style: {overflowY: 'hidden', overflowX: 'hidden' } };
	this.verticalScroller = {xtype: 'concesionariogrid'};
        this.listeners = {
                          itemclick : function(view) {
                           data = this.getSelectionModel().selected.items[0].data;
                           alert(data.ciudads_id);
                           asignarDatosConcesionario();
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.ConcesionarioGrid.superclass.initComponent.call(this);
    }
});

//Definicion de Tab
Ext.define('ventanatabconcesionario', {
    extend: 'Ext.tab.Panel',
	alias: 'widget.tabinformconcesionario',
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
                    title: 'Concesionario',
					items: [
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 20,
                                    id: 'rif',
                                    disabled: true,
                                    fieldLabel: 'Rif:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 60,
                                    id: 'nombre',
                                    disabled: true,
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 100,
                                    id: 'direccion',
                                    disabled: true,
                                    fieldLabel: 'Dirección'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 140,
                                    id: 'telefono',
                                    disabled: true,
                                    fieldLabel: 'Telefono'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 180,
                                    id: 'correo',
                                    width: 310,
                                    disabled: true,
                                    fieldLabel: 'Correo'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 220,
                                    id: 'ciudad',
                                    disabled: true,
                                    fieldLabel: 'Ciudad'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 100,
                                    y: 260,
                                    id: 'estado',
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
Ext.define('miVentanalistaconcesionario', {
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
                title       : 'Listados de Concesionarios',
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
                    		title: 'Lista de concesionarios',
                    		items: [
	                    		{ 
	                 			xtype:'concesionariogrid',
	                 			
	                 			viewConfig: {
	                    		   }
	                 		    },
	                 		    {
				                  xtype:'tabinformconcesionario',
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
   
function asignarDatosConcesionario () {
  Ext.getCmp('rif').setValue(data.rif);
  Ext.getCmp('nombre').setValue(data.nombre);
  Ext.getCmp('direccion').setValue(data.direccion);
  Ext.getCmp('telefono').setValue(data.telefono);
  Ext.getCmp('correo').setValue(data.correo);
  Ext.getCmp('cuidad').setValue(data.cuidads_id);
  // Ext.getCmp('estado').setValue(data.estado);
};

