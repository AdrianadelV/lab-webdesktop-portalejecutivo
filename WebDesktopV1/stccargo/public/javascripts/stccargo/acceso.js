   /**
   * acceso.js
   *
   * @autor Ing. Edgar Gonzalez
   * @copyright (c) 2012, Ing. Edgar Gonzalez
   * @fecha 11/04/2012
   * @version 1.0
   *
   * @license actualizarusuarios.js is licensed under the terms of the Open Source
   * LGPL 3.0 license. Commercial use is permitted to the extent that the
   * code/component(s) do NOT become part of another Open Source or Commercially
   * licensed development library or toolkit without explicit permission.
   *
   */

   var tabs = null;
   
   //Punto de entrada a la aplicacion
   Ext.onReady(function() {

   Ext.QuickTips.init();
     
   //Definicion de la clase MiPanel
   Ext.define('App.MiPanel', {
    extend: 'Ext.form.Panel',
    
    initComponent : function() {
      this.dockedItems = [ {
        dock: 'bottom',
        buttons: [{
          text: 'Ir a Pagina Principal',
          handler: function() {
           location.href="inicio"
          }
        },{
          text: 'Limpiar',
          handler: function() {
           Ext.getCmp('mipanelacceso').getForm().reset();
           Ext.getCmp('usuario').focus();
          }
        },{
         text: 'Enviar',
         formBind: true, // Disponible hasta que los campos esten validados
         disabled: true,
         handler: function() {
          enviar();  
         }
        }
        ]

        } ];
     //Llamamos a la super clase a iniciacion del componente
     App.MiPanel.superclass.initComponent.call(this);
    }
    
   });

   //Definicion de la clase MiPanelUsuario
   Ext.define('App.MiPanelUsuario', {
    extend: 'App.MiPanel',

    //Definicion del alias que puede usado en un xtype
    alias: 'widget.mipanelacceso',
    id: 'mipanelacceso',
    bodyPadding: 5,
    width: 350,

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion del panel
        this.items = [
         {
          fieldLabel: 'Usuario',
          xtype: 'textfield',
          name: 'usuario',
          id: 'usuario',
          allowBlank: false
         },{
          fieldLabel: 'Clave',
          xtype: 'textfield',
          name: 'clave',
          id: 'clave',
          inputType: 'password',
          allowBlank: false,
    listeners: {
                      specialkey: function(field, e){
                       if (e.getKey() == e.ENTER) {
                         enviar();
                       }
                      }
                    }
         }
        ];

        //Llamamos a la super clase a iniciacion del componente
        App.MiPanelUsuario.superclass.initComponent.call(this);
    }
   });
   
   //Calcular las posiciones x,y segun la resolucion del monitor del cliente para el tabpanel por ser un layout absolute
   var posx = 0;
   var posy = 0;
   var factorw = 0.3;
   var factorh = 0;
   //1024x768
   if (screen.width==1024 && screen.height==768)
   {
    factorw = 0.30;
    factorh = 0.000;
   }
   //1280x800
   if (screen.width==1280 && screen.height==800)
   {
    factorw = 0.25;
    factorh = 0.005;
   }
   //1280x1024
   if (screen.width==1280 && screen.height==1024)
   {
    factorw = 0.012;
    factorh = 0.10;
   }
   posx = parseInt(screen.width * factorw);
   posy = parseInt(screen.height * factorh);

   tabs = Ext.createWidget('tabpanel', {
        id: 'mitabpanel',
        renderTo: 'page',
        layout: 'absolute',
        title: 'Acceso',
        x: posx,
        y: posy,
        width: 350,
        height: 156,
        activeTab: 0,
        resizeTabs: true,
        enableTabScroll: true,
        
        closeAction :'hide',
        plain       : true,
        closable    : true,
        colapsable  : true,
        resizable   : true,
        modal       : false,
        
        defaults: {
            autoScroll:true,
            bodyPadding: 10
        },
        items: [{
            title: 'Datos de Acceso',
            xtype: 'mipanelacceso',
      itemId: 'mipanelu'
        }],
        renderTo: 'formularios'
    });

    Ext.getCmp('usuario').focus();

   }); // fin function onReady
   
   function enviar() {
     
     Ext.Ajax.request({
             url: 'acceso/validarsesion',
             //Enviando los parametros a la pagina servidora
             params: {
              usuario:  Ext.getCmp('usuario').getValue(),
              clave: Ext.getCmp('clave').getValue()
             },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
              datos=Ext.JSON.decode(resultado.responseText);
              if (datos.exito) {
               location.href=datos.url;
              }
              else {
               Ext.Msg.alert("Error", "Usuario o clave incorrecta!");
              }

              ;
             },
             //No hay retorno de la pagina servidora
             failure: function() {
              Ext.Msg.alert("Error", "Servidor no conectado");
             }
            });
     
   }
   
// final del archivo
