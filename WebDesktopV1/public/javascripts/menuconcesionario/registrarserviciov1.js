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

Ext.define('registrarservicios', {
    extend: 'Ext.window.Window',
    // x: 380,
     y: 210,
    height: 350,
    width: 620,
    layout: {
        type: 'absolute'
    },
    title: 'Registrar Planes de Servicios',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'tabpanel',
                    height: 350,
                    collapsed: false,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            height: 350,
                            width: 370,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Registrar Servicios',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 50,
                                    width: 320,
                                    fieldLabel: 'Nombre Servicio'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 90,
                                    width: 320,
                                    fieldLabel: 'Descripcion'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 130,
                                    width: 320,
                                    fieldLabel: 'Costo Servicio'
                                },
                                {
                                    xtype: 'button',
                                    x: 200,
                                    y: 170,
                                    width: 70,
                                    text: 'Guardar'
                                },
                                {
                                    xtype: 'button',
                                    x: 280,
                                    y: 170,
                                    width: 70,
                                    text: 'Cancelar'
                                },
                                {
                                    xtype: 'combobox',
                                    x: 30,
                                    y: 10,
                                    width: 320,
                                    fieldLabel: 'Nombre del Plan'
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 350,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Editar Servicios',
                            items: [
                                {
                                    xtype: 'combobox',
                                    x: 30,
                                    y: 10,
                                    width: 320,
                                    fieldLabel: 'Nombre Servicio'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 60,
                                    width: 320,
                                    fieldLabel: 'Descripcion'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 100,
                                    width: 320,
                                    fieldLabel: 'Costo Servicio'
                                },
                                {
                                    xtype: 'button',
                                    x: 200,
                                    y: 170,
                                    width: 70,
                                    text: 'Editar'
                                },
                                {
                                    xtype: 'button',
                                    x: 280,
                                    y: 170,
                                    width: 80,
                                    text: 'Cancelar'
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Eliminar Servicios',
                            items: [
                                {
                                    xtype: 'combobox',
                                    x: 30,
                                    y: 10,
                                    width: 320,
                                    fieldLabel: 'Nombre Servicio'
                                },{
                                    xtype: 'button',
                                    x: 270,
                                    y: 70,
                                    width: 80,
                                    text: 'Aceptar'
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 350,
                            width: 370,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Registrar Planes',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 50,
                                    width: 320,
                                    fieldLabel: 'Nombre del Plan'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 90,
                                    width: 320,
                                    fieldLabel: 'Descripcion'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 130,
                                    width: 320,
                                    fieldLabel: 'Costo del Plan'
                                },
                                {
                                    xtype: 'button',
                                    x: 200,
                                    y: 170,
                                    width: 70,
                                    text: 'Guardar'
                                },
                                {
                                    xtype: 'button',
                                    x: 280,
                                    y: 170,
                                    width: 70,
                                    text: 'Cancelar'
                                },
                            ]
                        },
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});
