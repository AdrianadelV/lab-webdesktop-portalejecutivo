Ext.define('indicadoresdeta', {
    extend: 'Ext.window.Window',

    height: 350,
    width: 340,
    collapsible:true,
    y : 560,
    x : 49,
    autoScroll: true,
    layout: {
        type: 'absolute'
    },
    title: 'Detalle del Indicador',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                            xtype: 'label',
                            x: 20,
                            y: 20,
                            height: 20,
                            width: 180,
                            text: 'Rango de la fecha Definida'
                        },
                        {
                            xtype: 'label',
                            x: 20,
                            y: 50,
                            height: 20,
                            width: 80,
                            text: '01/07/2012'
                        },
                        {
                            xtype: 'label',
                            x: 110,
                            y: 50,
                            height: 20,
                            width: 70,
                            text: '01/01/2013'
                        },
                        {
                            xtype: 'label',
                            x: 20,
                            y: 90,
                            height: 20,
                            width: 190,
                            text: 'Rango de la Valores Validos'
                        },
                        {
                            xtype: 'label',
                            x: 20,
                            y: 140,
                            width: 40,
                            text: 'Rojo'
                        },
                        {
                            xtype: 'label',
                            x: 120,
                            y: 140,
                            height: 20,
                            width: 70,
                            text: 'Amarillo'
                        },
                        {
                            xtype: 'label',
                            x: 220,
                            y: 140,
                            height: 20,
                            width: 70,
                            text: 'Verde'
                        },
                        {
                            xtype: 'label',
                            x: 20,
                            y: 170,
                            height: 20,
                            width: 70,
                            text: '[0,40]'
                        },
                        {
                            xtype: 'label',
                            x: 120,
                            y: 170,
                            height: 20,
                            width: 80,
                            text: '[41,70]'
                        },
                        {
                            xtype: 'label',
                            x: 220,
                            y: 170,
                            text: '[71,+∞)'
                        },
                        {
                            xtype: 'label',
                            x: 20,
                            y: 200,
                            height: 20,
                            width: 150,
                            text: 'Responsable: Nombre'
                        },
                        {
                            xtype: 'label',
                            x: 20,
                            y: 230,
                            height: 20,
                            width: 260,
                            text: 'Correo: nombreresponsable@gmail.com'
                        },
                        {
                            xtype: 'label',
                            x: 20,
                            y: 260,
                            height: 20,
                            width: 200,
                            text: 'Teléfono: 0416-6665544'
                        }
                        
            ]
        });

        me.callParent(arguments);
    }

});