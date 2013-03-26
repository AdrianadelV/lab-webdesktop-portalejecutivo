Ext.define('MyApp.view.MyWindow', {
    extend: 'Ext.window.Window',

    height: 247,
    width: 436,
    title: 'Registrar Caracteristicas del Modelo',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    height: 205,
                    layout: {
                        type: 'absolute'
                    },
                    bodyPadding: 10,
                    title: '',
                    items: [
                        {
                            xtype: 'combobox',
                            x: 30,
                            y: 20,
                            width: 360,
                            fieldLabel: 'Modelo del Vehículo:'
                        },
                        {
                            xtype: 'combobox',
                            x: 30,
                            y: 80,
                            width: 360,
                            fieldLabel: 'Caracteristica Asociada:'
                        },
                        {
                            xtype: 'button',
                            x: 310,
                            y: 150,
                            text: 'Registrar'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});