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
 Ext.define('Usuarios', {
    extend: 'Ext.data.Model',
    fields: [ 'cedula', 'nombre', 'posicion','modelo','concesionario','ubicacion','fecha']
});

//Definicion del Data Store
var usuarioStore = Ext.create('Ext.data.Store', {
    model: 'Usuarios',
    data: [
        { cedula: '18923926', nombre: 'Fernando Colmenarez', posicion : '1',modelo :'focus',concesinario :'Bel Motors',ubicacion:'Barquisimeto',fecha :'01/01/2013' },
        { cedula: '12345678', nombre: 'Maria Paez', posicion : '2',modelo :'explorer',concesinario :'Tunal Motors',ubicacion:'Quibor',fecha :'09/01/2013' },
        { cedula: '98765432', nombre: 'Adriana Santana', posicion : '3',modelo :'fortaleza',concesinario :'Decaro Motors',ubicacion:'Barquisimeto',fecha :'10/01/2013' },
        { cedula: '13218466', nombre: 'Jose M Galindez', posicion : '4',modelo :'focus',concesinario :'Uribana Motors',ubicacion:'Cuji-tamaca',fecha :'11/01/2013' }
    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.UsuariosGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.usuariosgrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Cedula", width: 60, dataIndex: 'cedula', sortable: true},
            {text: "Nombre", flex: 90, dataIndex: 'nombre', sortable: true},
            {text: "Posicion", width: 100, dataIndex: 'posicion', sortable: true},
            {text: "Modelo", width: 100, dataIndex: 'modelo', sortable: true},
            {text: "Concesionario", width: 100, dataIndex: 'concesionario', sortable: true},
            {text: "Ubicacion", width: 100, dataIndex: 'ubicacion', sortable: true},
            {text: "Fecha", width: 100, dataIndex: 'fecha', sortable: true},
        ];
        this.dockedItems = [ {
	  		xtype: 'pagingtoolbar',
                    dock: 'bottom',
                    width: 360,
                    displayInfo: true,
                    displayMsg : 'Personas en espera {0} - {1} de {2}',
	  	} ];
        // Origen de los datos, de un data store
        this.store = usuarioStore;
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
        App.UsuariosGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('lista_espera', {
    extend: 'Ext.window.Window',

                layout: 'absolute',
                	x: 350,
                	y: 210,
                width       : 900,
                height      : 170,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                modal       : false,
                title       : 'Lista de Espera',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'usuariosgrid' }
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
