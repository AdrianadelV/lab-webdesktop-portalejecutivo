Ext.define('VentanaMarca', {
	extend : 'Ext.window.Window',
	id : 'registrarmarca',
	height : 398,
	width : 520,
	x : 380,
	y : 225,
	tooltip: 'Registrar Marca',
	layout : {
		type : 'absolute'
	},
	bodyBorder : true,
	collapsible : true,
	title : 'Registrar Marca',

	initComponent : function() {
		var me = this;

		Ext.applyIf(me, {
			items : [{
				xtype : 'panel',
				x : 0,
				y : 0,
				height : 300,
				width : 520,
				id : 'panelmarca',
				layout : {
					type : 'absolute'
				},
				items : [{
					xtype : 'textfield',
					x : 20,
					y : 20,
					fieldLabel : 'Nombre',
					allowBlank : false,
					blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Nombre de la Marca',
                    vtype: 'alphanum',
					id : 'nombre'

				}, {
					xtype : 'textfield',
					x : 20,
					y : 60,
					fieldLabel : 'Imagen',
					allowBlank : false,
					blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Imagen de la Marca',
                    vtype: 'alphanum',
					id : 'imagen'
				}, {
					xtype : 'textfield',
					x : 20,
					y : 100,
					fieldLabel : 'Mision',
					allowBlank : false,
					blankText: 'Este campo es requerido',
                    minLength: 30,
                    emptyText: 'Mision De la Marca',
                    vtype: 'alphanum',
					id : 'mision'
				}, {
					xtype : 'textfield',
					x : 20,
					y : 140,
					fieldLabel : 'Vision',
					allowBlank : false,
					blankText: 'Este campo es requerido',
                    minLength: 30,
                    emptyText: 'Vision de la Marca',
                    vtype: 'alphanum',
					id : 'vision'
				}, {
					xtype : 'textfield',
					x : 20,
					y : 180,
					fieldLabel : 'Valores',
					allowBlank : false,
					blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Nombre del Concesionario',
                    vtype: 'alphanum',
					id : 'valores'
				}, {
					xtype : 'textfield',
					x : 20,
					y : 220,
					fieldLabel : 'Contacto',
					allowBlank : false,
					blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Contacto de la Marca',
                    vtype: 'alphanum',
					id : 'contacto'
				}, {
					xtype : 'button',
					x : 270,
					y : 260,
					tooltip : 'Registrar una Marca',
					text : 'Registrar',
					id:'registrar',
					listeners : {
						click : function() {
							Ext.Ajax.request({
								url : 'menu_admin/grabar_marca',
								params : {
									ajax : 'true',
									funcion : 'grabar_marca',
									nombre : Ext.getCmp('nombre').getValue(),
									imagen : Ext.getCmp('imagen').getValue(),
									mision : Ext.getCmp('mision').getValue(),
									vision : Ext.getCmp('vision').getValue(),
									valores : Ext.getCmp('valores').getValue(),
									contacto : Ext.getCmp('nombre').getValue(),
								},
								success : function(exito, request) {
									Ext.Msg.alert("Exito", "Se ha Guardado la Marca!!");
									Ext.getCmp('nombre').setValue("");
									Ext.getCmp('imagen').setValue("");
									Ext.getCmp('vision').setValue("");
									Ext.getCmp('mision').setValue("");
									Ext.getCmp('valores').setValue("");
									Ext.getCmp('contacto').setValue("");
									Ext.getCmp('nombre').focus();
									datos = Ext.JSON.decode(exito, reponseText);
								},
								failure : function() {
									Ext.Msg.alert("Error", "Servidor NO Conectado!!");
								}
							});
						}
					}
				}, {
					xtype : 'button',
					x : 180,
					y : 260,
					text : 'Cancelar',
					tooltip : 'Cancelar',
					id : 'cancelar',
					listeners : {
						click : function() {
							Ext.getCmp('nombre').setValue("");
							Ext.getCmp('imagen').setValue("");
							Ext.getCmp('vision').setValue("");
							Ext.getCmp('mision').setValue("");
							Ext.getCmp('valores').setValue("");
							Ext.getCmp('contacto').setValue("");
						}
					}
				}]
			}]
		});

		me.callParent(arguments);
	}
});
