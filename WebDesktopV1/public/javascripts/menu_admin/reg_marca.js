Ext.define('VentanaMarca', {
    extend: 'Ext.window.Window',

    height: 398,
    width: 520,
    x: 380,
	y: 225,
    layout: {
        type: 'absolute'
    },
    bodyBorder: true,
    collapsible: true,
    title: 'Registrar Marca',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'panel',
                    x: 0,
                    y: 0,
                    height: 300,
                    width:  520,
                    layout: {
                        type: 'absolute'
                    },
                    items: [
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 20,
                            fieldLabel: 'nombre',
                            id:'nombre'
                            
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 60,
                            fieldLabel: 'Imagen de la Marca',
                            id:'imagen'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 100,
                            fieldLabel: 'Mision',
                            id:'mision'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 140,
                            fieldLabel: 'Vision',
                            id:'vision'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 180,
                            fieldLabel: 'Valores',
                            id:'valores'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 220,
                            fieldLabel: 'Contacto',
                            id:'contacto'
                        },
                        {
                            xtype: 'button',
                            x: 270,
                            y: 260,
                            text: 'Registrar',
                            listeners:{
                            	click: function(){
                            		alert('Pase');
                            		Ext.Ajax.request({
                            			url:'menu_admin/grabar_marca',
                            			params:{
                            				ajax: 'true',
                            				funcion:'grabar_marca',
                            				nombre  :Ext.getCmp('nombre').getValue(),
                            				imagen  :Ext.getCmp('imagen').getValue(),
                            				mision  :Ext.getCmp('mision').getValue(),
                            				vision  :Ext.getCmp('vision').getValue(),
                            				valores :Ext.getCmp('valores').getValue(),
                            				contacto:Ext.getCmp('nombre').getValue(),
                            			},
                            			sucess: function(resultado,request)
                            			{
                            				datos =Ext.JSON.decode(resultado,reponseText);
                            				Ext.Msg.alert('Mensaje',datos.message);
                            			},
                            			failure: function(){
                            				Ext.Msg.alert("Error","Servidor NO Conectado!!");
                            			}
                            		});
                            	}
                            }
                         },
                        {
                            xtype: 'button',
                            x: 180,
                            y: 260,
                            text: 'Cancelar'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});