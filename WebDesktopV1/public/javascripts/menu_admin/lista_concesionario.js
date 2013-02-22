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
 Ext.define('Concesionario', {
    extend: 'Ext.data.Model',
    fields: [ 'marca', 'concesionario', 'estado', 'ciudad']
});

//Definicion del Data Store
var concesionarioStore = Ext.create('Ext.data.Store', {
    model: 'Concesionario',
    data: [
        { marca: 'Ford', concesionario : 'FordCard', estado:'Lara', ciudad: 'Barquisimeto' },
        { marca: 'Fiat', concesionario : 'FiatCard', estado:'Yaracuy', ciudad: 'San Felipe' },
        { marca: 'Chevrolet', concesionario : 'ChevyCard', estado:'Lara', ciudad: 'Quibor' },
        { marca: 'Huyndai', concesionario : 'HuyndaiCard', estado:'Carabobo', ciudad: 'Valencia' },
        { marca: 'Daewood', concesionario : 'DaewoodCard', estado:'Lara', ciudad: 'Barquisimeto' },

    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.ConcesionarioGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.concesionariogrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 20, sortable: true},
            {text: "Marca", width: 60, dataIndex: 'marca', sortable: true},
            {text: "Concesionario", width: 100, dataIndex: 'concesionario', sortable: true},
            {text: "Estado", width: 100, dataIndex: 'estado', sortable: true},
            {text: "Ciudad", width: 100, dataIndex: 'ciudad', sortable: true},
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
                  			 ventanalista.close();
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.ConcesionarioGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miVentanalistaconcesionario', {
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
                    		]
		                 },    		          		    
                ],
                   });

        me.callParent(arguments);
    }
   });
