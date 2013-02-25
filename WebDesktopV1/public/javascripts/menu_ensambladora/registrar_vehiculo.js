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

Ext.define('miVentana', {
    extend: 'Ext.window.Window',

	x: 350,
    y: 210,
    height: 307,
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
                    x: 0,
                    y: 0,
                    height: 350,
                    width: 560,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            height: 323,
                            width: 416,
                            layout: {
                                type: 'absolute'
                            },
                            bodyBorder: false,
                            collapsible: false,
                            title: 'Datos Generales',
                            items: [
                                {
                                    xtype: 'container',
                                    x: 40,
                                    y: 10,
                                    border: 10,
                                    height: 200,
                                    width: 350,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    items: [
                                        {
                                            xtype: 'label',
                                            x: 40,
                                            y: 10,
                                            height: 20,
                                            width: 40,
                                            text: 'Modelo:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 40,
                                            y: 50,
                                            height: 20,
                                            width: 50,
                                            text: 'Color:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 40,
                                            y: 90,
                                            height: 20,
                                            text: 'Nombre:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 40,
                                            y: 130,
                                            height: 20,
                                            width: 30,
                                            text: 'Descripcion:'
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 90,
                                            width: 170,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 50,
                                            width: 170,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 10,
                                            width: 170,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textareafield',
                                            x: 120,
                                            y: 130,
                                            height: 60,
                                            width: 170,
                                            fieldLabel: ''
                                        },
		                                {
		                                    xtype: 'button',
		                                    x: 300,
                                            y: 8,
		                                    height: 23,
		                                    width: 20,
		                                    text: '',
		                                    listeners : {
												click : function() {
													ventana_modelo = Ext.create('catalogo');
													ventana_modelo.show();
												}
											}
		                                }
                                    ]
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 122,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Dimensiones',
                            items: [
                                {
                                    xtype: 'container',
                                    x: 20,
                                    y: 30,
                                    border: 10,
                                    height: 170,
                                    styleHtmlContent: true,
                                    width: 200,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    items: [
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 10,
                                            height: 20,
                                            width: 100,
                                            text: 'Longitud total (mm):'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 50,
                                            height: 20,
                                            width: 90,
                                            text: 'Ancho total (mm):'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 90,
                                            height: 20,
                                            width: 80,
                                            text: 'Altura total (mm):'
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 110,
                                            y: 90,
                                            width: 70,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 110,
                                            y: 50,
                                            width: 70,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 110,
                                            y: 10,
                                            width: 70,
                                            fieldLabel: ''
                                        }
                                    ]
                                },
                                {
                                    xtype: 'container',
                                    x: 220,
                                    y: 0,
                                    border: 10,
                                    height: 180,
                                    styleHtmlContent: true,
                                    width: 210,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    items: [
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 40,
                                            width: 70,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 80,
                                            width: 70,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 120,
                                            width: 70,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'label',
                                            x: 20,
                                            y: 40,
                                            height: 20,
                                            width: 70,
                                            text: 'Peso neto (Kg):'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 20,
                                            y: 80,
                                            height: 20,
                                            width: 70,
                                            text: 'Peso bruto (Kg):'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 20,
                                            y: 120,
                                            height: 20,
                                            width: 90,
                                            text: 'Capacidad de pasajeros:'
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 176,
                            width: 416,
                            layout: {
                                type: 'absolute'
                            },
                            bodyBorder: false,
                            collapsible: false,
                            title: 'Motor',
                            items: [
                                {
                                    xtype: 'container',
                                    x: 0,
                                    y: 10,
                                    border: 10,
                                    height: 180,
                                    width: 270,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    items: [
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 10,
                                            height: 20,
                                            width: 40,
                                            text: 'Marca:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 50,
                                            height: 20,
                                            width: 50,
                                            text: 'Tipo:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 90,
                                            height: 20,
                                            text: 'Desplazamiento:'
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 130,
                                            width: 110,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 130,
                                            height: 20,
                                            width: 100,
                                            text: 'Nro. Cilindros:'
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 90,
                                            width: 110,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 50,
                                            width: 110,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 10,
                                            width: 110,
                                            fieldLabel: ''
                                        }
                                    ]
                                },
                                {
                                    xtype: 'container',
                                    x: 230,
                                    y: 10,
                                    border: 10,
                                    height: 180,
                                    width: 250,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    items: [
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 10,
                                            width: 90,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 50,
                                            width: 90,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 120,
                                            y: 90,
                                            width: 90,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 10,
                                            height: 40,
                                            width: 120,
                                            text: 'Potencia Maxima:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 50,
                                            height: 40,
                                            width: 60,
                                            text: 'Combustible:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 90,
                                            height: 30,
                                            width: 90,
                                            text: 'Capacidad de Combustible:'
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 313,
                            width: 558,
                            layout: {
                                type: 'absolute'
                            },
                            bodyBorder: false,
                            collapsible: false,
                            title: 'Chasis',
                            items: [
                                {
                                    xtype: 'container',
                                    x: 10,
                                    y: 20,
                                    border: 10,
                                    height: 170,
                                    width: 460,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    items: [
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 10,
                                            height: 20,
                                            width: 40,
                                            text: 'Transmisión:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 50,
                                            height: 20,
                                            width: 50,
                                            text: 'Tracción:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 80,
                                            height: 20,
                                            width: 80,
                                            text: 'Suspensión delantera:'
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 100,
                                            y: 130,
                                            width: 100,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 320,
                                            y: 10,
                                            width: 100,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 320,
                                            y: 50,
                                            width: 100,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 320,
                                            y: 90,
                                            width: 100,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 320,
                                            y: 130,
                                            width: 100,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'label',
                                            x: 10,
                                            y: 130,
                                            height: 20,
                                            width: 100,
                                            text: 'Suspensión trasera:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 230,
                                            y: 10,
                                            height: 20,
                                            width: 100,
                                            text: 'Suspensión trasera:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 230,
                                            y: 50,
                                            height: 20,
                                            width: 100,
                                            text: 'Frenos delanteros:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 230,
                                            y: 90,
                                            height: 30,
                                            width: 60,
                                            text: 'Frenos traseros:'
                                        },
                                        {
                                            xtype: 'label',
                                            x: 230,
                                            y: 130,
                                            height: 10,
                                            width: 100,
                                            text: 'Neumáticos:'
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 100,
                                            y: 90,
                                            width: 100,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 100,
                                            y: 50,
                                            width: 100,
                                            fieldLabel: ''
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 100,
                                            y: 10,
                                            width: 100,
                                            fieldLabel: ''
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            height: 323,
                            width: 558,
                            layout: {
                                type: 'absolute'
                            },
                            bodyBorder: false,
                            collapsible: false,
                            title: 'Equipamiento',
                            items: [
                                {
                                    xtype: 'container',
                                    x: 50,
                                    y: 0,
                                    border: 10,
                                    height: 210,
                                    width: 360,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    items: [
                                        {
                                            xtype: 'checkboxfield',
                                            x: 20,
                                            y: 15,
                                            fieldLabel: 'Aire Acondicionado',
                                            boxLabel: ''
                                        },
                                        {
                                            xtype: 'checkboxfield',
                                            x: 190,
                                            y: 20,
                                            fieldLabel: 'Alarma anti robo',
                                            boxLabel: ''
                                        },
                                        {
                                            xtype: 'checkboxfield',
                                            x: 20,
                                            y: 50,
                                            fieldLabel: 'Radio FM/CD/MP3',
                                            boxLabel: ''
                                        },
                                        {
                                            xtype: 'checkboxfield',
                                            x: 190,
                                            y: 60,
                                            fieldLabel: 'Faros anti niebla',
                                            boxLabel: ''
                                        },
                                        {
                                            xtype: 'checkboxfield',
                                            x: 20,
                                            y: 90,
                                            fieldLabel: 'Tapiceria de Tela',
                                            boxLabel: ''
                                        },
                                        {
                                            xtype: 'checkboxfield',
                                            x: 20,
                                            y: 130,
                                            fieldLabel: 'Tapiceria de Curo',
                                            boxLabel: ''
                                        },
                                        {
                                            xtype: 'checkboxfield',
                                            x: 190,
                                            y: 100,
                                            fieldLabel: 'Frenos ABS',
                                            boxLabel: ''
                                        },
                                        {
                                            xtype: 'checkboxfield',
                                            x: 190,
                                            y: 130,
                                            fieldLabel: 'Rines de Aluminio',
                                            boxLabel: ''
                                        }
                                    ]
                                },
                                {
                                    xtype: 'button',
                                    x: 450,
                                    y: 80,
                                    height: 30,
                                    width: 65,
                                    text: 'Cancelar'
                                },
                                {
                                    xtype: 'button',
                                    x: 450,
                                    y: 40,
                                    height: 30,
                                    width: 65,
                                    text: 'Registrar'
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

              		