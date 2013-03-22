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
var marcaStore=null;

Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*',
				'Ext.container.Viewport',
    			'Ext.container.ButtonGroup',
    			'Ext.panel.Panel'
	         ]);


Ext.define('Marcas', {
 extend: 'Ext.data.Model',
           fields: [
            {name: 'id', type: 'int'},
            {name: 'nombre', type: 'varchar'},
            {name: 'mision', type: 'varchar'},
            {name: 'vision', type: 'text'},
            {name: 'valores', type: 'text'},
            {name: 'contacto', type: 'text'},
           ],
});

//Definicion del Data Store
 marcaStore = Ext.create('Ext.data.Store', {
    model: 'Marcas',
    autoLoad: true,
    proxy: {
         type: 'ajax',
         url : 'menu_admin/generardatalistamarcas',
         reader: {
                  type: 'json',
                  root: 'datos'
              }
           }
});


//Definicion de la clase MarcasGrid
Ext.define('App.MarcasGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.marcasgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 20, sortable: true},
            {text: "Nombre", width: 60, dataIndex: 'nombre', sortable: true},
            {text: "Mision", width: 100, dataIndex: 'mision', sortable: true},
            {text: "Vision", width: 100, dataIndex: 'vision', sortable: true},
            {text: "Valores", width: 100, dataIndex: 'valores', sortable: true},
            {text: "Contacto", width: 100, dataIndex: 'contacto', sortable: true},
        ];
        // this.dockedItems = [ {
	  		// xtype: 'pagingtoolbar',
                    // dock: 'bottom',
                    // width: 360,
                    // displayInfo: true,
                    // displayMsg : 'Personas en espera {0} - {1} de {2}',
	  	// } ];
        // Origen de los datos, de un data store
        this.store = marcaStore;
        this.forceFit = true;
		this.scroll = true;
		this.viewConfig = { style: {overflowY: 'hidden', overflowX: 'hidden' } };
		this.verticalScroller = {xtype: 'marcasgrid'};
	        this.listeners = {
	                          itemclick : function(view) {
	                           data = this.getSelectionModel().selected.items[0].data;
	                  			 // ventanalista.close();
	                          }
	                         };
	        //Llamamos a la super clase a iniciacion del componente
        App.MarcasGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miVentanalistamarca', {
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
                title       : 'Listados de Marcas',
                buttonAlign : 'center',
                constrain   : true,
        		collapsible: true,
        	    renderTo: 'tree_el', 
        	    initComponent: function() {
        			var me = this;  
        			marcaStore.load(),
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
                    		title: 'Lista de Marcas',
                    		items: [
	                    		{ 
	                 			xtype:'marcasgrid',
	                 			
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
