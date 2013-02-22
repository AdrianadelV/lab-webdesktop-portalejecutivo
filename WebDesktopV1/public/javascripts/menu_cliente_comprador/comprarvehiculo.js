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

Ext.define('comprarvehiculo', {
    extend: 'Ext.window.Window',

    height: 400,
    width: 765,
    x: 360,
    y: 210,
    layout: {
        type: 'absolute'
    },
    title: 'Comprar Vehiculo',

    initComponent: function() {
        var me = this;
        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'textfield',
                    x: 20,
                    y: 30,
                    fieldLabel: 'Vehiculo'
                },
                {
                    xtype: 'textareafield',
                    x: 20,
                    y: 70,
                    height: 80,
                    fieldLabel: 'Caracteristicas Vehiculo'
                },
                {
                    xtype: 'textfield',
                    x: 20,
                    y: 170,
                    fieldLabel: 'Concesionario'
                },
                {
                    xtype: 'tabpanel',
                    x: 350,
                    y: 30,
                    height: 300,
                    width:400,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            height: 272,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Credito',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 40,
                                    y: 32,
                                    width: 310,
                                    fieldLabel: 'Nro Tarjeta de Credito'
                                },
                                {
                                    xtype: 'datefield',
                                    x: 40,
                                    y: 70,
                                    width: 310,
                                    fieldLabel: 'Fecha de Vencimiento'
                                },
                                {
                                    xtype: 'textfield',
                                    x: 40,
                                    y: 110,
                                    width: 310,
                                    fieldLabel: 'Codigo de Seguridad'
                                },
                                {
                                    xtype: 'label',
                                    x: 40,
                                    y: 180,
                                    text: 'Importe Total'
                                },
                                {
                                    xtype: 'label',
                                    x: 270,
                                    y: 180,
                                    text: 'Bs.F 150.000'
                                },
                                {
                                    xtype: 'button',
                                    x: 140,
                                    y: 210,
                                    text: 'Completar Compra',
                                    listeners : {
										click : function() {
										    alert('Transaccion Exitosa..Imprimiendo Factura');
										    ventana.close();
										    ventana = Ext.create('MyApp.view.Factura');
										    ventana.show();
										    var tip = Ext.create('Ext.tip.ToolTip', {
    										target: 'button',
    										html: 'Press this button to clear the form'
											});
										    }
									    }
									    
								 },
                                {
                                    xtype: 'button',
                                    x: 280,
                                    y: 210,
                                    width: 70,
                                    text: 'Cancelar'
                                }
                            ]
                        },
                        // {
                            // xtype: 'panel',
                            // layout: {
                                // type: 'absolute'
                            // },
                            // title: 'Debito'
                        // },
                        {
                            xtype: 'panel',
                            height: 155,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Transferencia Bancaria',
                            items: [
                                {
                                    xtype: 'textfield',
                                    x: 30,
                                    y: 70,
                                    width: 300,
                                    fieldLabel: 'Nro de Referencia'
                                },
                                {
                                    xtype: 'combobox',
                                    x: 30,
                                    y: 30,
                                    width: 300,
                                    fieldLabel: 'Banco'
                                },
                                {
                                    xtype: 'button',
                                    x: 130,
                                    y: 200,
                                    text: 'Completar Compra',
                                    listeners : {
										click : function() {
										    //ventana.close();
										    alert('Transaccion Exitosa..Imprimiendo Factura');
										    ventana.close();
										    var ventana = Ext.create('MyApp.view.Factura');
										    ventana.show();
										    }
									    }
                                },
                                {
                                    xtype: 'button',
                                    x: 270,
                                    y: 200,
                                    text: 'Cancelar'
                                },
                                {
                                    xtype: 'label',
                                    x: 30,
                                    y: 150,
                                    text: 'Importe total'
                                },   
                                {
                                    xtype: 'label',
                                    x: 250,
                                    y: 150,
                                    text: 'Bs.f 150.000'
                                }
                            ]
                        }
                    ]
                }
            ]
        });
        // listeners : {
					// itemclick : function(view, node) {
					// if (button.get('text') == "Completar Compra") {
					// alert('holas  ke hace');
					// ventana = Ext.create('factura');
					// ventana.show();
		// }
        me.callParent(arguments);
       // alert(button.get('text'));
    }

});
