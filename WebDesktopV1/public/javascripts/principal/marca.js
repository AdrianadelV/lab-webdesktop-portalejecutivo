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
         text: 'Comprar',
         formBind: true, // Disponible hasta que los campos esten validados
         disabled: true,
         handler: function() {
          enviar();  
         }
        }]
        } ];
     //Llamamos a la super clase a iniciacion del componente
     App.MiPanel.superclass.initComponent.call(this);
    }
    
   });

   //Definicion de la clase MiPanelUsuario
   Ext.define('App.MiPanelMarca', {
    extend: 'App.MiPanel',

    //Definicion del alias que puede usado en un xtype
    alias: 'widget.mipanelgaleria',
    id: 'mipanelgaleria',
    bodyPadding: 5,
    width: 350,

    //Sobre escribimos este metodo de Ext.grid.Panel
    initComponent : function() {
        //Definicion del panel
        // this.items = [
         // {
          // fieldLabel: 'Usuario',
          // xtype: 'textfield',
          // name: 'usuario',
          // id: 'usuario',
          // allowBlank: false
         // },{
          // fieldLabel: 'Clave',
          // xtype: 'textfield',
          // name: 'clave',
          // id: 'clave',
          // inputType: 'password',
          // allowBlank: false,
    // listeners: {
                      // specialkey: function(field, e){
                       // if (e.getKey() == e.ENTER) {
                         // enviar();
                       // }
                      // }
                    // }
         // }
        // ]
        ;

        //Llamamos a la super clase a iniciacion del componente
        App.MiPanelMarca.superclass.initComponent.call(this);
    }
   });
   
   tabs = Ext.createWidget('tabpanel', {
        id: 'mitabpanel',
        // renderTo: 'page',
        layout: 'absolute',
        title: 'Acceso',
        x: 325,
        y: -500,
        width: 800,
        height: 500,
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
            title: 'Galeria',
            xtype: 'mipanelgaleria',
      itemId: 'mipanelu'
        }],
        renderTo: 'formularios'
    });

    Ext.getCmp('usuario').focus();

   });