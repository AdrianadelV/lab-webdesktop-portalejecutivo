Ext.define('VentanaMarca', {
    extend: 'Ext.window.Window',

    height: 298,
    width: 320,
    x: 380,
	y: 150,
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
                    height: 270,
                    layout: {
                        type: 'absolute'
                    },
                    items: [
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 80,
                            fieldLabel: 'Nombre de la Marca'
                        },
                        {
                            xtype: 'button',
                            x: 220,
                            y: 190,
                            text: 'Registrar'
                        },
                        {
                            xtype: 'button',
                            x: 130,
                            y: 190,
                            text: 'Cancelar'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});