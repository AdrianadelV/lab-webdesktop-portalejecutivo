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

//Definicion del Modelo
 Ext.define('Catalogo', {
    extend: 'Ext.data.Model',
    fields: [ 'modelo', 'color', 'ano']
});

//Definicion del Data Store
var catalogoStore = Ext.create('Ext.data.Store', {
    model: 'Catalogo',
    data: [
        { modelo: 'Explorer', color: 'Plateada', ano : '2013' },
        { modelo: 'Runner', color: 'Negro', ano : '2011' },
        { modelo: 'Tritom', color: 'Blanco', ano : '2012' },
        { modelo: 'SuperDutty', color: 'Rojo', ano : '2012' }
    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.CatalogoGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.catalogogrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Modelo", width: 60, dataIndex: 'modelo', sortable: true},
            {text: "Color", flex: 90, dataIndex: 'color', sortable: true},
            {text: "Año", width: 100, dataIndex: 'ano', sortable: true},
        ];
        this.dockedItems = [ {
	  		xtype: 'pagingtoolbar',
                    dock: 'bottom',
                    width: 360,
                    displayInfo: true,
                    displayMsg : 'Personas en espera {0} - {1} de {2}',
	  	} ];
        // Origen de los datos, de un data store
        this.store = catalogoStore;
        this.forceFit = true;
	this.scroll = false;
	this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
	//this.verticalScroller = {xtype: 'paginggridscroller'};
        this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                           //alert(data.usuario);
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.CatalogoGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('catalogo', {
    extend: 'Ext.window.Window',

                layout: 'absolute',
                x: 480,
                y: 268,
                width       : 300,
                height      : 200,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                modal       : false,
                collapsible : true,
                title       : 'Lista de Espera',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'catalogogrid' }
                 /*{
                    xtype: 'button',
                    text: 'Aceptar',
                    width: 50,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       if (data!=null) {
                        var usuario = data.usuario;
                        var clave = data.clave;
                        var nivel = data.nivel;
                        Ext.MessageBox.show({
                         title: 'Mensaje',
                         msg: 'El usuario seleccionado es: ' + usuario + '<br>' + 'La clave seleccionada es: ' + clave + '<br>' + 'El nivel seleccionado es: ' + nivel,
                         width:400,
                         buttons: Ext.MessageBox.OK
                        });
                       }
                       else {
                       	alert("No ha seleccionado un item."); 
                       }
                      }
                    }
                },
                {
                    xtype: 'button',
                    text: 'Salir',
                    width: 50,
                    heigth: 50,
                    listeners: {
                      click : function() {
                       ventana.close();
                      }
                    }
                }*/
                ]


            });
//Instanciamos la ventana
//Ext.onReady(function() {
 //ventana = Ext.create('miVentana');
 // //Definimos un boton para luego mostrar la ventana
 // boton = Ext.create('Ext.Button',
             // { 
             	// text: 'Listado de Personas en Espera',
             	// renderTo: Ext.getBody(),
                // handler : function()
		        // {
                 //ventana.show();
                 
            // });
//});
