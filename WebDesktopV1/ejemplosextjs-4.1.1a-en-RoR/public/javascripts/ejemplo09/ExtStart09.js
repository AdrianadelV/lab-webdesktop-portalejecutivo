/*********************************************************/
/*                 ExtStart09.js                         */
/*********************************************************/
/*
  Autor  : Edgar Gonzalez
  Version: 1.0 en javascript 1.2
  Fecha  : 14 de noviembre del 2012
*/
var data = null;
var ventana = null;
var boton = null;

//Definicion del Modelo
 Ext.define('Usuarios', {
    extend: 'Ext.data.Model',
    fields: [ 'usuario', 'clave', 'nivel' ]
});

//Definicion del Data Store
var usuarioStore = Ext.create('Ext.data.Store', {
    model: 'Usuarios',
    autoLoad: true,
    proxy: {
              type: 'ajax',
              url : 'ajaxejemplo09',
              reader: {
                  type: 'json',
                  root: 'datos'
              }
          }
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
            {text: "Usuario", width: 120, dataIndex: 'usuario', sortable: true},
            {text: "Clave", flex: 1, dataIndex: 'clave', sortable: true},
            {text: "Nivel", width: 100, dataIndex: 'nivel', sortable: true}
        ];
        this.dockedItems = [ {
	  xtype: 'toolbar',
	  dock: 'bottom',
	  items: [
	  
	   { xtype: 'button',
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
                }	    
	  ]
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
                           alert(data.usuario);
                          }
                         };
        //Llamamos a la super clase a iniciacion del componente
        App.UsuariosGrid.superclass.initComponent.call(this);
    }
});

//Definicion de la ventana contendora del grid
Ext.define('miVentana', {
    extend: 'Ext.window.Window',

                layout: 'fit',
                x: 100,
                y: 70,
                width       : 385,
                height      : 200,
                closeAction :'hide',
                plain       : true,
                closable    : true,
                colapsable  : true,
                resizable   : true,
                maximizable : true,
                minimizable : true,
                modal       : true,
                title       : 'Catalogo de Usuarios',
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
Ext.onReady(function() {
 ventana = Ext.create('miVentana');
 //Definimos un boton para luego mostrar la ventana
 boton = Ext.create('Ext.Button',
             { 
             	text: 'Catalogo',
             	renderTo: Ext.getBody(),
                handler : function()
		        {
                  ventana.show();
                }
             });
});