   /**
   * actualizardatos.js
   *
   * @autor Ing. Edgar Gonzalez
   * @copyright (c) 2012, Ing. Edgar Gonzalez
   * @fecha 05/04/2012
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
          text: 'Limpiar',
          handler: function() {
            Ext.getCmp('mipanelpersonales').getForm().reset();
            Ext.getCmp('mipanelusuario').getForm().reset();
            var activeTab = tabs.getActiveTab();
            if (activeTab.id=='mipanelpersonales') {
             Ext.getCmp('nombre').focus();
            }
            else {
             Ext.getCmp('cn1').focus();
            }
          }
        },{
         text: 'Cargar',
         formBind: false,
         disabled: false,
         handler: function() {

            Ext.Ajax.request({
             url: 'actualizardatos/cargar',
             //Enviando los parametros a la pagina servidora
             params: {
              ajax: 'true',
              funcion: 'cargar'
             },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
              //alert(resultado.responseText);
              datos=Ext.JSON.decode(resultado.responseText);
              if (datos.success) {
               Ext.getCmp('usuario').setValue(datos.usuario);
               Ext.getCmp('ca').setValue(datos.clave);
               Ext.getCmp('nombre').setValue(datos.nombre);
               Ext.getCmp('correo').setValue(datos.correo);
               Ext.getCmp('celular').setValue(datos.celular);
               Ext.getCmp('twitter').setValue(datos.twitter);
               Ext.getCmp('direccion').setValue(datos.direccion);
               Ext.getCmp('telefono').setValue(datos.telefono);
              }
              else {
               Ext.Msg.alert("Error", "Datos no encontrados!");	
              }
             },
             //No hay retorno de la pagina servidora
             failure: function() {
              Ext.Msg.alert("Error", "Servidor no conectado");
             }
            });
            var activeTab = tabs.getActiveTab();
            if (activeTab.id=='mipanelpersonales') {
             Ext.getCmp('nombre').focus();
            }
            else {
             Ext.getCmp('cn1').focus();
            }
         }
        }, {
         text: 'Grabar',
         formBind: true, // Disponible hasta que los campos esten validados
         disabled: true,
         handler: function() {
          if ( Ext.getCmp('cn1').getValue()==Ext.getCmp('cn2').getValue() ) {

            Ext.Ajax.request({
             url: 'actualizardatos/grabar',
             //Enviando los parametros a la pagina servidora
             params: {
              ajax: 'true',
              funcion: 'grabar',
              nombre: Ext.getCmp('nombre').getValue(), //obtiene el valor a traves del id del campo
              correo: Ext.getCmp('correo').getValue(),
              twitter: Ext.getCmp('twitter').getValue(),
              celular: Ext.getCmp('celular').getValue(),
              direccion: Ext.getCmp('direccion').getValue(),
              telefono: Ext.getCmp('telefono').getValue(),
              usuario: Ext.getCmp('usuario').getValue(),
              ca: Ext.getCmp('ca').getValue(),
              cn1: Ext.getCmp('cn1').getValue(),
              cn2: Ext.getCmp('cn2').getValue(),
             },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
              datos=Ext.JSON.decode(resultado.responseText);
              Ext.Msg.alert('Mensaje', datos.msg);
             },
             //No hay retorno de la pagina servidora
             failure: function() {
              Ext.Msg.alert("Error", "Servidor no conectado!");
             }
            });
            
          }
          else {
            Ext.Msg.alert("Error", "La clave nueva y la repetida no coinciden!");
          }
         }
        }
        ]

        } ];
     //Llamamos a la super clase a iniciacion del componente
     App.MiPanel.superclass.initComponent.call(this);
    }
    
   });
   
   //Definicion de la clase MiPanelPersonales
   Ext.define('App.MiPanelPersonales', {
    extend: 'App.MiPanel',

    //Definicion del alias que puede usado en un xtype
    alias: 'widget.mipanelpersonales',
    id: 'mipanelpersonales',
    bodyPadding: 5,
    width: 450,

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion del panel
        this.items = [
        {
         fieldLabel: 'Nombre',
         xtype: 'textfield',
         name: 'nombre',
         id: 'nombre',
         allowBlank: false
        },{
         fieldLabel: 'Correo',
         xtype: 'textfield',
         name: 'correo',
         id: 'correo',
         allowBlank: false,
         vtype: 'email'
          /*listeners: {
                      specialkey: function(field, e){
                       if (e.getKey() == e.ENTER) {
                         valido = validaremail(Ext.getCmp('correo').getValue());
                         if (!valido) {
                          Ext.Msg.alert("Error", "El correo tiene formato correcto pero No Existe!");
                         }

                       }
                      }
                    }*/
        },{
         fieldLabel: 'Celular',
         xtype: 'textfield',
         name: 'celular',
         id: 'celular',
         allowBlank: false
        },{
         fieldLabel: 'Twitter',
         xtype: 'textfield',
         name: 'twitter',
         id: 'twitter',
         allowBlank: false
        },{
            fieldLabel: 'Direccion',
            xtype: 'textfield',
            name: 'direccion',
            id: 'direccion',
            width: 400,
            allowBlank: false
        },{
            fieldLabel: 'Telefono',
            xtype: 'textfield',
            name: 'telefono',
            id: 'telefono',
            allowBlank: false
           }
        ];

        //Llamamos a la super clase a iniciacion del componente
        App.MiPanelPersonales.superclass.initComponent.call(this);
  Ext.getCmp('nombre').focus();
    }
   });

   //Definicion de la clase MiPanelUsuario
   Ext.define('App.MiPanelUsuario', {
    extend: 'App.MiPanel',

    //Definicion del alias que puede usado en un xtype
    alias: 'widget.mipanelusuario',
    id: 'mipanelusuario',
    bodyPadding: 5,
    width: 450,

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion del panel
        this.items = [
         {
          fieldLabel: 'Usuario',
          xtype: 'textfield',
          name: 'usuario',
          id: 'usuario',
          disabled: true,
          allowBlank: false
         },{
          fieldLabel: 'Clave Anterior',
          xtype: 'textfield',
          name: 'ca',
          id: 'ca',
    disabled: true,
          allowBlank: false
         },{
          fieldLabel: 'Clave Nueva',
          xtype: 'textfield',
          name: 'cn1',
          id: 'cn1',
          allowBlank: false
         },{
          fieldLabel: 'Repetir Clave',
          xtype: 'textfield',
          name: 'cn2',
          id: 'cn2',
          allowBlank: false
         }
        ];

        //Llamamos a la super clase a iniciacion del componente
        App.MiPanelUsuario.superclass.initComponent.call(this);
  
    }
   });
   
   //Calcular las posiciones x,y segun la resolucion del monitor del cliente para el tabpanel por ser un layout absolute
   var posx = 0;
   var posy = 0;
   var factorw = 0.20;
   var factorh = 0.005;
   //1024x768
   if (screen.width==1024 && screen.height==768)
   {
    factorw = 0.25;
    factorh = 0.000;
   }
   //1280x800
   if (screen.width==1280 && screen.height==800)
   {
    factorw = 0.35;
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
        title: 'Actualizar Datos',
        x: posx,
        y: posy,
        width: 450,
        height: 250,
        activeTab: 0,
        resizeTabs: true,
        enableTabScroll: true,
        layoutOnTabChange: true,
        
        closeAction :'hide',
        plain       : true,
        closable    : true,
        colapsable  : true,
        resizable   : true,
        modal       : false,
  
        /*listeners: {
         'tabchange': function(tabPanel, tab){
                if (tab.id=='mipanelpersonales') {
                 Ext.getCmp('nombre').focus();
                }
                else {
                 Ext.getCmp('cn1').focus();
                }
          }
         },*/
        
        defaults: {
            autoScroll:true,
            bodyPadding: 10
        },
        items: [{
            title: 'Personales',
            xtype: 'mipanelpersonales',
            itemId: 'mipanelp',
            tabTip: 'Actualizar los Datos Personales del <b>Administrador</b>'
        },{
            title: 'Usuario',
            xtype: 'mipanelusuario',
            itemId: 'mipanelu',
            tabTip: 'Actualizar los Datos de Usuario del <b>Administrador</b>'
        }],
        renderTo: 'formularios'
    });

     Ext.getCmp('nombre').focus();
     
   }); // fin function onReady
   
   function validaremail(correo) {
     var existe = 0;
     var loadingMask = new Ext.LoadMask(Ext.getBody(), { msg: "Validando email..." });
     loadingMask.show();
     Ext.Ajax.request({
             url: '../../controller/actualizardatos_controller.php',
             //Enviando los parametros a la pagina servidora
              params: {
              ajax: true,
              email: correo,
              funcion: 'validaremail'
             },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
             success: function( resultado, request ) {
              loadingMask.hide();
              datos=Ext.JSON.decode(resultado.responseText);
              existe=datos.existe;
             },
             //No hay retorno de la pagina servidora
             failure: function() {
              loadingMask.hide();
             }
     });
     return existe;
    }
   

   
// final del archivo
