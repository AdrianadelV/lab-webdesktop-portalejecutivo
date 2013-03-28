Ext.define('MyApp.view.MyWindow', {
    extend: 'Ext.window.Window',

    height: 450,
    width: 732,
    layout: {
        type: 'absolute'
    },
    title: 'Configurar Indicador',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    x: 0,
                    y: -1,
                    height: 440,
                    width: 720,
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
                            width: 480,
                            fieldLabel: 'Indicador'
                        },
                        {
                            xtype: 'combobox',
                            x: 280,
                            y: 80,
                            fieldLabel: 'Unidad'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 80,
                            fieldLabel: 'Valor de la Meta'
                        },
                        {
                            xtype: 'datefield',
                            x: 540,
                            y: 80,
                            fieldLabel: 'Fecha de la Meta'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 130,
                            fieldLabel: 'Valor Amarillo'
                        },
                        {
                            xtype: 'datefield',
                            x: 280,
                            y: 130,
                            width: 270,
                            fieldLabel: 'Fecha Amarillo'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 180,
                            fieldLabel: 'Valor Rojo'
                        },
                        {
                            xtype: 'datefield',
                            x: 280,
                            y: 180,
                            width: 270,
                            fieldLabel: 'Fecha Rojo'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 230,
                            fieldLabel: 'Valor Verde'
                        },
                        {
                            xtype: 'datefield',
                            x: 280,
                            y: 230,
                            width: 270,
                            fieldLabel: 'Fecha Verde'
                        },
                        {
                            xtype: 'combobox',
                            x: 20,
                            y: 280,
                            fieldLabel: 'Estado del Indicador'
                        },
                        {
                            xtype: 'combobox',
                            x: 280,
                            y: 280,
                            width: 270,
                            fieldLabel: 'Frecuancia de la Notificacion'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 330,
                            fieldLabel: 'Responsable'
                        },
                        {
                            xtype: 'textfield',
                            x: 290,
                            y: 330,
                            fieldLabel: 'Correo del Responsable'
                        },
                        {
                            xtype: 'textfield',
                            x: 560,
                            y: 330,
                            fieldLabel: 'Telefono'
                        },
                        {
                            xtype: 'button',
                            x: 630,
                            y: 390,
                            text: 'Guardar la Configuracion'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});