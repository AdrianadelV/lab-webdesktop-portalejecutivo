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
                            fieldLabel: 'Nombre de la Marca'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 60,
                            fieldLabel: 'Imagen de la Marca'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 100,
                            fieldLabel: 'Mision'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 140,
                            fieldLabel: 'Vision'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 180,
                            fieldLabel: 'Valores'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 220,
                            fieldLabel: 'Contacto'
                        },
                        {
                            xtype: 'button',
                            x: 270,
                            y: 260,
                            text: 'Registrar'
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