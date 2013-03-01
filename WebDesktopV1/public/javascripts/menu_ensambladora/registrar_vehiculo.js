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

Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*',
				'Ext.container.Viewport',
    			'Ext.container.ButtonGroup',
    			'Ext.panel.Panel'
	         ]);

Ext.define('miVetanaRegistrar', {
    extend: 'Ext.window.Window',

    x: 350,
    y: 210,
    height: 340,
    width: 560,
    layout: {
        type: 'absolute'
    },
    bodyBorder: true,
    collapsible: true,
    renderTo: 'viewRegistrar',
    title: 'Registrar Nuevo Vehiculo',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'tabpanel',
                    height: 302,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Datos Generales',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 110,
                                    y: 20,
                                    fieldLabel: 'Modelo'
                                },
                                {
                                    xtype: 'button',
                                    x: 380,
                                    y: 20,
                                    height: 20,
                                    width: 30,
                                    listeners : {
									click : function() {
										ventana_modelo = Ext.create('catalogo');
										ventana_modelo.show();
										}
									}
                                },
                                {
                                    xtype: 'textfield',
                                    x: 110,
                                    y: 70,
                                    fieldLabel: 'Color:'
                                },
                                {
                                    xtype: 'textareafield',
                                    x: 110,
                                    y: 110,
                                    fieldLabel: 'Descripción:'
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 234,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Descripción',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 10,
                                    y: 30,
                                    fieldLabel: 'Marca del Motor:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 270,
                                    y: 30,
                                    fieldLabel: 'Transmisión:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 10,
                                    y: 70,
                                    fieldLabel: 'Tipo de Motor:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 270,
                                    y: 70,
                                    fieldLabel: 'Tipo de Frenos:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 10,
                                    y: 110,
                                    fieldLabel: 'N°. Cilindros:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 270,
                                    y: 110,
                                    fieldLabel: 'Tipo de Tapiceria:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 10,
                                    y: 150,
                                    width: 250,
                                    fieldLabel: 'Tipo Compbustible:'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 270,
                                    y: 160,
                                    width: 250,
                                    fieldLabel: 'N°. Pasajeros:'
                                },
                                {
                                    xtype: 'button',
                                    x: 440,
                                    y: 220,
                                    text: 'Eliminar'
                                },
                                {
                                    xtype: 'button',
                                    x: 350,
                                    y: 220,
                                    text: 'Guardar'
                                },
                                {
                                    xtype: 'button',
                                    x: 260,
                                    y: 220,
                                    text: 'Limpiar'
                                }
                            ]
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});

              		