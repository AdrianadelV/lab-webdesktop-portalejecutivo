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

Ext.define('VentanaEnsambladoraAdmin', {
    extend: 'Ext.window.Window',

    height: 390,
	width: 614,
	x: 380,
	y: 150,
    layout: {
        type: 'absolute'
    },
    bodyBorder: true,
    collapsible: true,
    title: 'Registrar Ensambladora',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'tabpanel',
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            height: 340,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Datos Ensambladora',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 30,
                                    width: 410,
                                    fieldLabel: 'rif'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 310,
                                    y: 130,
                                    width: 270,
                                    fieldLabel: 'Teléfono'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 80,
                                    width: 410,
                                    fieldLabel: 'Nombre'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 130,
                                    width: 280,
                                    fieldLabel: 'Correo'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 240,
                                    width: 560,
                                    fieldLabel: 'Dirección'
                                },
                                {
                                    xtype: 'combobox',
                                    x: 20,
                                    y: 180,
                                    width: 280,
                                    fieldLabel: 'Estado'
                                },
                                {
                                    xtype: 'combobox',
                                    x: 310,
                                    y: 180,
                                    width: 270,
                                    fieldLabel: 'Ciudad'
                                },
                                {
                                    xtype: 'combobox',
                                    x: 20,
                                    y: 290,
                                    width: 280,
                                    fieldLabel: 'Marca Asociada'
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 340,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Datos del Usuario',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 30,
                                    width: 300,
                                    fieldLabel: 'Nombre de Usuario'
                                },
                                {
                                    xtype: 'label',
                                    x: 20,
                                    y: 90,
                                    height: 20,
                                    width: 110,
                                    text: 'Rol del Usuario:'
                                },
                                {
                                    xtype: 'label',
                                    x: 130,
                                    y: 90,
                                    height: 40,
                                    width: 160,
                                    text: 'Ensambladora'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 130,
                                    width: 300,
                                    fieldLabel: 'Contraseña'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 20,
                                    y: 180,
                                    width: 300,
                                    fieldLabel: 'Confirmar Contraseña'
                                },
                                {
                                    xtype: 'button',
                                    x: 510,
                                    y: 260,
                                    text: 'Registrar'
                                },
                                {
                                    xtype: 'button',
                                    x: 430,
                                    y: 260,
                                    text: 'Cancelar'
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