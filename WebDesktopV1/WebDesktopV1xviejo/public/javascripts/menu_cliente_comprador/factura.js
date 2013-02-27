Ext.define('MyApp.view.Factura', {
    extend: 'Ext.window.Window',

    height: 530,
    width: 845,
    x : 370,
	y : 210,
    layout: {
        type: 'absolute'
    },
    collapsed: false,
    title: 'Factura Vehiculo',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'container',
                    x: 40,
                    y: 74
                },
                {
                    xtype: 'label',
                    x: 540,
                    y: 20,
                    height: 20,
                    width: 80,
                    text: '00-313357'
                },
                {
                    xtype: 'label',
                    x: 540,
                    y: 50,
                    text: 'FACTURA'
                },
                {
                    xtype: 'label',
                    x: 540,
                    y: 70,
                    height: 30,
                    text: '081415'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 90,
                    text: 'Nombre :  Comprador de Vehiculo'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 120,
                    text: 'Dirección : Av. Las industrias  24-10 Barquisimeto Edo. Lara'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 150,
                    text: 'R.I.F.: V-123456789-0'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 180,
                    text: 'Telefonos :0251-2315550'
                },
                {
                    xtype: 'label',
                    x: 540,
                    y: 90,
                    text: 'Fecha : 03/02/2013'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 210,
                    text: 'Concesionario : Bel Motors C.A'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 240,
                    height: 20,
                    width: 180,
                    text: 'Forma de Pago : Credito'
                },
                {
                    xtype: 'image',
                    x: 10,
                    y: 10,
                    height: 100,
                    width: 190,
                    html: '<img src="images/gobierno1.jpeg">'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 300,
                    height: 20,
                    width: 70,
                    text: 'Codigo '
                },
                {
                    xtype: 'label',
                    x: 170,
                    y: 300,
                    height: 20,
                    width: 90,
                    text: 'Descripcion'
                },
                {
                    xtype: 'label',
                    x: 110,
                    y: 320,
                    text: 'AVEO SE 4 Puertas 1.6 Litros Full equipo '
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 320,
                    text: 'O9AVEO'
                },
                {
                    xtype: 'label',
                    x: 420,
                    y: 300,
                    text: 'Garantia'
                },
                {
                    xtype: 'label',
                    x: 390,
                    y: 320,
                    text: '1 Año o 50.000 Km'
                },
                {
                    xtype: 'label',
                    x: 540,
                    y: 300,
                    text: 'Cantidad'
                },
                {
                    xtype: 'label',
                    x: 560,
                    y: 320,
                    text: '1'
                },
                {
                    xtype: 'label',
                    x: 630,
                    y: 300,
                    text: 'Precio Unitario'
                },
                {
                    xtype: 'label',
                    x: 640,
                    y: 320,
                    text: '150.000'
                },
                {
                    xtype: 'label',
                    x: 760,
                    y: 300,
                    text: 'Total'
                },
                {
                    xtype: 'label',
                    x: 750,
                    y: 320,
                    text: '150.000'
                },
                {
                    xtype: 'label',
                    x: 620,
                    y: 380,
                    text: 'Total Factura...Bs.F : 150.000'
                }
            ]
        });

        me.callParent(arguments);
    }

});
