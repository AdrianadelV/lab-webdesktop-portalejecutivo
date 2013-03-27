Ext.define('MyApp.view.MyWindow', {
    extend: 'Ext.window.Window',

    height: 300,
    width: 547,
    layout: {
        type: 'absolute'
    },
    title: 'Galeria',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    x: -1,
                    y: 10,
                    height: 270,
                    width: 550,
                    layout: {
                        type: 'absolute'
                    },
                    bodyPadding: 10,
                    title: '',
                    items: [
                        {
                            xtype: 'combobox',
                            x: 20,
                            y: 20,
                            fieldLabel: 'Marca'
                        },
                        {
                            xtype: 'combobox',
                            x: 290,
                            y: 20,
                            fieldLabel: 'Modelos'
                        },
                        {
                            xtype: 'button',
                            x: 450,
                            y: 230,
                            text: 'Comprar'
                        },
                        {
                            xtype: 'image',
                            x: 20,
                            y: 60,
                            height: 90,
                            width: 201
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});