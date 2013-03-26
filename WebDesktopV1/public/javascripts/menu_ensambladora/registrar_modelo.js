Ext.define('MyApp.view.MyWindow', {
    extend: 'Ext.window.Window',

    height: 467,
    width: 559,
    layout: {
        type: 'absolute'
    },
    title: 'Registrar Vehiculo Modelo',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'tabpanel',
                    x: -2,
                    y: 0,
                    height: 380,
                    activeTab: 0,
                    items: [
                        {
                            xtype: 'panel',
                            height: 283,
                            title: 'Modelo Vehículo',
                            items: [
                                {
                                    xtype: 'form',
                                    height: 359,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    bodyPadding: 10,
                                    title: '',
                                    items: [
                                        {
                                            xtype: 'textareafield',
                                            x: 60,
                                            y: 20,
                                            width: 400,
                                            fieldLabel: 'Descripción',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Descripción general del modelo del vehículo'
                                        },
                                        {
                                            xtype: 'textfield',
                                            x: 60,
                                            y: 100,
                                            width: 270,
                                            fieldLabel: 'Año del Modelo',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Año de fabricación'
                                        },
                                        {
                                            xtype: 'combobox',
                                            x: 60,
                                            y: 140,
                                            fieldLabel: 'Marca:',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Seleccionar'
                                        },
                                        {
                                            xtype: 'combobox',
                                            x: 60,
                                            y: 180,
                                            width: 270,
                                            fieldLabel: 'Tipo de Vehiculo:',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Seleccionar'
                                        },
                                        {
                                            xtype: 'filefield',
                                            x: 60,
                                            y: 230,
                                            width: 400,
                                            fieldLabel: 'Imagen Modelo:',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Imagen de Presetación 1'
                                        },
                                        {
                                            xtype: 'filefield',
                                            x: 60,
                                            y: 270,
                                            width: 400,
                                            fieldLabel: 'Imagen Modelo:',
                                            blankText: 'Este campo es Requerido',
                                            emptyText: 'Imagen de Presetación 2'
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            title: 'Caracteristicas del modelo',
                            items: [
                                {
                                    xtype: 'form',
                                    height: 358,
                                    layout: {
                                        type: 'absolute'
                                    },
                                    bodyPadding: 10,
                                    items: [
                                        {
                                            xtype: 'combobox',
                                            x: 70,
                                            y: 40,
                                            width: 350,
                                            fieldLabel: 'Modelo Vehículo:'
                                        },
                                        {
                                            xtype: 'combobox',
                                            x: 70,
                                            y: 100,
                                            width: 350,
                                            fieldLabel: 'Tapiceria:'
                                        },
                                        {
                                            xtype: 'combobox',
                                            x: 70,
                                            y: 160,
                                            width: 350,
                                            fieldLabel: 'Color:'
                                        },
                                        {
                                            xtype: 'combobox',
                                            x: 70,
                                            y: 230,
                                            width: 350,
                                            fieldLabel: 'Transmisión:'
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    xtype: 'button',
                    x: 240,
                    y: 400,
                    text: 'Eliminar'
                },
                {
                    xtype: 'button',
                    x: 340,
                    y: 400,
                    text: 'Limpiar'
                },
                {
                    xtype: 'button',
                    x: 420,
                    y: 400,
                    text: 'Guardar'
                }
            ]
        });

        me.callParent(arguments);
    }

});