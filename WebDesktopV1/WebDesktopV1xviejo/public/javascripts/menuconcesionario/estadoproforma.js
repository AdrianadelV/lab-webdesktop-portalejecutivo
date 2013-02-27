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
 Ext.define('Proforma', {
    extend: 'Ext.data.Model',
    fields: [ 'id_proforma', 'id_banco', 'id_detalle_v','id_comprador','id_concesionario','fecha','validez','estatus']
});

//Definicion del Data Store
var proformaStore = Ext.create('Ext.data.Store', {
    model: 'Proforma',
    data: [
        { id_proforma: '00099', id_banco: 'Banesco',id_detalle_v: 'Chevrolet Vitara 2.0 litros 4 ptas',id_comprador :'7770182', id_concesionario : 'tunal motors',fecha :'01/02/2013',validez:'01/03/2013',estatus:'Aprobado' },

{ id_proforma: '000100', id_banco: 'Mercantil',id_detalle_v: 'Chevrolet Aveo 1.6 lts 4 ptas',id_comprador :'7181252', id_concesionario : 'tunal motors',fecha :'02/02/2013',validez:'02/03/2013',estatus:'Aprobado' },

{ id_proforma: '000101', id_banco: 'Banco Bicentenario',id_detalle_v: 'Mazda 6 2.0 lts 4 ptas',id_comprador :'7770182', id_concesionario : 'Asia motors',fecha :'03/02/2013',validez:'03/03/2013',estatus:'Aprobado' },

{ id_proforma: '000102', id_banco: 'BOD banco Universal',id_detalle_v: 'Chevrolet Vitara',id_comprador :'7770182', id_concesionario : 'bel motors',fecha :'04/02/2013',validez:'04/03/2013',estatus:'Aprobado' },

{ id_proforma: '000103', id_banco: 'Mercantil',id_detalle_v: 'Chevrolet Vitara 2.4 lts 4 pts',id_comprador :'7770182', id_concesionario : 'tunal motors',fecha :'14/02/2013',validez:'14/03/2013',estatus:'Aprobado' },

{ id_proforma: '000104', id_banco: 'Banco Venezuela',id_detalle_v: 'Chevrolet Vitara',id_comprador :'7770182', id_concesionario : 'tunal motors',fecha :'15/02/2013',validez:'15/03/2013',estatus:'Aprobado' },

{ id_proforma: '000105', id_banco: 'Banesco',id_detalle_v: 'Chevrolet Vitara',id_comprador :'7770182', id_concesionario : 'tunal motors',fecha :'16/02/2013',validez:'------',estatus:'No Aprobado' }      
    ]
});

//Definicion de la clase UsuariosGrid
Ext.define('App.ProformaGrid', {
    extend: 'Ext.grid.Panel',
    //Definicion del alias que puede usado en un xtype
    alias: 'widget.proformagrid',

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion de las columnas del grid
        this.columns = [
            {xtype: 'rownumberer', width: 40, sortable: false},
            {text: "Nro Proforma", width: 60, dataIndex: 'id_proforma', sortable: true},
            {text: "Banco", flex: 90, dataIndex: 'id_banco', sortable: true},
            {text: "Detalle", width: 100, dataIndex: 'id_detalle_v', sortable: true},
            {text: "Cedula Comprador", width: 100, dataIndex: 'id_comprador', sortable: true},
            {text: "Concesionario", width: 100, dataIndex: 'id_concesionario', sortable: true},
            {text: "Fecha", width: 100, dataIndex: 'fecha', sortable: true},
            {text: "Validez", width: 100, dataIndex: 'validez', sortable: true},
            {text: "Estatus", width: 100, dataIndex: 'estatus', sortable: true}
        ];
     	this.dockedItems = [ {
	  		xtype: 'pagingtoolbar',
                    dock: 'bottom',
                    width: 360,
                    displayInfo: true,
                    displayMsg : 'Personas en espera {0} - {1} de {2}',
	  	} ];
        // Origen de los datos, de un data store
        this.store = proformaStore;
        this.forceFit = true;
	this.scroll = false;
	this.viewConfig = { style: {overflow: 'auto', overflowX: 'hidden' } };
	//this.verticalScroller = {xtype: 'paginggridscroller'};
        this.listeners = {
                          itemclick : function() {
                           data = this.getSelectionModel().selected.items[0].data;
                           // alert(data.usuario);
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.UsuariosGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('edoproforma', {
    extend: 'Ext.window.Window',

                layout: 'absolute',
                x: 350,
                y: 210,
                width       : 900,
                height      : 250,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                collapsible : true,
                resizable   : true,
                modal       : false,
                title       : 'Estado de la Proforma',
                buttonAlign : 'center',
                constrain   : true,
                items:[
                 { xtype:'proformagrid' }
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
		// itemclick:function(view,node){
	    // Ext.create('MyApp.view.MyPanel', {
		// renderTo : 'tree_el',
		// title:node.get('text')
								 // });

