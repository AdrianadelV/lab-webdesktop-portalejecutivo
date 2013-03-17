Ext.define('proforma_banco', {
    extend: 'Ext.window.Window',
    x:350,
    y:250,
    height: 723,
    width: 877,
    layout: {
        type: 'absolute'
    },
    title: 'Proforma',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'label',
                    x: 300,
                    y: 30,
                    height: 20,
                    width: 250,
                    text: 'Solicitud de Crédito Personal Natural'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 70,
                    width: 310,
                    fieldLabel: 'Concesionario',
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Nombre del Concesionario',
                    vtype: 'alpha',
                    vtypeText: 'solo texto'
                    
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 100,
                    height: 20,
                    text: 'DATOS DEL SOLICITANTE'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 170,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Nombre',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Nombre(S)',
                    id:'nombre'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 170,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Apellido',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Apellido(S)',
                    id:'apellido'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 220,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Telefono',
                    vtype: 'alphanum',
                    vtypeText: 'solo numeros',
                    fieldLabel: 'Telefono',
                    id:'telefono'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 220,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Direccion',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Direccion',
                    id:'direccion'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 270,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Email',
                    fieldLabel: 'Correo Electronico',
                    vtype: 'email',
                    vtypeText: 'email',
                    id:'correo'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 320,
                    text: 'DATOS DE LA OPERACION'
                },
                {
                    xtype: 'datefield',
                    x: 370,
                    y: 70,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Fecha',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Fecha',
                    id:'fecha2'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 360,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Marca',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Marca'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 360,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Modelo',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Modelo'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 410,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Año del Vehiculo',
                    vtype: 'alpha',
                    vtypeText: 'solo numero',
                    fieldLabel: 'Año'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 410,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Color',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Color'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 460,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Costo',
                    vtype: 'alphanum',
                    vtypeText: 'solo Numero',
                    fieldLabel: 'Costo'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 460,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Tipo Vehiculo',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Tipo Vehiculo'
                },
                {
                    xtype: 'button',
                    x: 340,
                    y: 630,
                    height: 30,
                    width: 80,
                    text: 'Enviar ',
                    tooltip: 'Enviar Proforma al Banco'
                },
                {
                    xtype: 'button',
                    x: 450,
                    y: 630,
                    height: 30,
                    width: 80,
                    text: 'Cancelar',
                    tooltip: 'Cancelar envio'
                },
                {
                    xtype: 'datefield',
                    x: 370,
                    y: 270,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Validez',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Validez',
                    id:'validez'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 120,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Cedula',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Cedula',
                    id:'cedula'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 120,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Sexo',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Sexo',
                    id:'sexo'
                }
            ]
        });

        me.callParent(arguments);
    }

});