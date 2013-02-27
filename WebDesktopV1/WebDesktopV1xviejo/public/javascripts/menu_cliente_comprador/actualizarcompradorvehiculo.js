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

Ext.define('actualizar', {
    extend: 'Ext.window.Window',

    height: 360,
    width: 500,
    x:370,
    y:210,
    layout: {
        type: 'absolute'
    },
    title: 'Actualizar',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'tabpanel',
                    x: -4,
                    y: -2,
                    height: 360,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            height: 360,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Informacion Personal',
                            items: [
                                {
                                    xtype: 'container'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 20,
                                    fieldLabel: 'Nombres'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 50,
                                    fieldLabel: 'Apellidos'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 80,
                                    fieldLabel: 'Direccion'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 140,
                                    fieldLabel: 'Correo'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 110,
                                    fieldLabel: 'Telefono'
                                },
                                {
                                    xtype: 'button',
                                    x: 190,
                                    y: 180,
                                    text: 'Aceptar'
                                },
                                {
                                    xtype: 'button',
                                    x: 264,
                                    y: 180,
                                    text: 'Cancelar'
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 360,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Cuenta de Usuario',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 60,
                                    y: 30,
                                    fieldLabel: 'Contraseña anterior'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 60,
                                    y: 70,
                                    fieldLabel: 'Contraseña nueva'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 60,
                                    y: 110,
                                    fieldLabel: 'Repetir Contraseña'
                                },
                                {
                                    xtype: 'button',
                                    x: 220,
                                    y: 180,
                                    text: 'Aceptar'
                                },
                                {
                                    xtype: 'button',
                                    x: 295,
                                    y: 180,
                                    text: 'Cancelar'
                                }
                            ]
                        },
                        // {
                            // xtype: 'panel',
                            // layout: {
                                // type: 'absolute'
                            // },
                            // title: 'Tab 3'
                        // }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});
