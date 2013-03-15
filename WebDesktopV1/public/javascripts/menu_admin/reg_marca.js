var marcaStore = null;
var data = null;
Ext.define('VentanaMarca', {
	extend : 'Ext.window.Window',

	height : 549,
	id : 'ventanamarca',
	width : 661,
	x : 380,
	y : 225,
	layout : {
		type : 'absolute'
	},
	title : 'Registrar Marca',

	initComponent : function() {
		var me = this;

		Ext.applyIf(me, {
			items : [{
				xtype : 'form',
				x : 0,
				y : 0,
				autoRender : false,
				height : 420,
				id : 'formulariomarca',
				layout : {
					type : 'absolute'
				},
				bodyPadding : 10,
				title : '',
				items : [{
					xtype : 'textfield',
					x : 60,
					y : 50,
					formBind : false,
					width : 320,
					tabIndex : 1,
					fieldLabel : 'Nombre',
					msgTarget : 'under',
					blankText : 'Este campo es requerido',
					enableKeyEvents : true,
					minLength : 1,
					emptyText : 'Nombre de la Marca',
					vtype : 'alphanum',
					listeners : {
						specialkey : function(field, e) {
							if (e.getKey() == e.ENTER) {
								buscar_marca();
							}
						}
					},
					id : 'nombre'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 100,
					width : 360,
					id : 'imagen',
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Imagen de la Marca',
					fieldLabel : 'Imagen'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 150,
					width : 360,
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Mision de la Marca',
					id : 'mision',
					fieldLabel : 'Mision'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 200,
					width : 360,
					id : 'vision',
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Vision de la Marca',
					fieldLabel : 'Vision'
				}, {
					xtype : 'image',
					id : 'imagen0',
					x : 450,
					y : 45,
					border : '',
					frame : true,
					height : 110,
					width : 130,
					src : 'images/AEVEV4.png'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 250,
					width : 360,
					id : 'valores',
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Valores de la Marca',
					fieldLabel : 'Valores'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 300,
					width : 360,
					id : 'contacto',
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Contactos de la Marca',
					fieldLabel : 'Contacto'
				}, {
					xtype : 'button',
					x : 390,
					y : 50,
					text : '.....',
					id : 'btncatalogo',
					listeners : {
						click : function() {
							alert('pase');
							//this.findById("formulario")
						}
					}
				}, {
					xtype : 'button',
					x : 155,
					y : 350,
					text : 'Eliminar',
					icon : 'images/eliminar.png',
					tooltip : 'Eliminar Marca',
					id : 'btneliminar'
				}, {
					xtype : 'button',
					x : 250,
					y : 350,
					text : 'Limpiar',
					icon : 'images/limpiar.png',
					id : 'btncancelar',
					listeners : {
						click : function() {
							Ext.getCmp('formulariomarca').getForm().reset();
						}
					}
				}, {
					xtype : 'button',
					x : 340,
					y : 350,
					text : 'Guardar',
					icon : 'images/grabar.png',
					tooltip : 'Registrar una Marca',
					id : 'btnregistrar',
					listeners : {
						click : function() {
							grabar_marca();
						}
					}
				}]
			}]
		});

		//metodo para hacer grabar los datos
		function grabar_marca() {
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
					contacto : Ext.getCmp('contacto').getValue(),
				},
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito, reponseText);
					datos = Ext.JSON.decode(exito, reponseText);
					Ext.Msg.alert("Exito", "Se ha Guardado la Marca!!");
					Ext.getCmp('formulariomarca').getForm().reset();
					Ext.getCmp('btnregistrar').disable(false);
				},
				failure : function() {
					Ext.Msg.alert("Error", "Servidor NO Conectado!!");
				}
			});
		}

		//metodo seleccionar marca
		function eliminar_marca() {
			Ext.Ajax.request({
				url : 'menu_admin/eli_marca',
				params : {
					ajax : 'true',
					funcion : 'eli_marca',
					nombre : Ext.getCmp('nombre').getValue()
				},
				//Retorno exitoso de la pagina servidora a traves del formato JSON
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito.responseText);
					if (datos.exito == 'true') {
						Ext.Msg.alert("Mensaje", datos.msg);
					} else {
						Ext.Msg.alert("Mensaje", datos.msg);
					}
				},
				//No hay retorno de la pagina servidora
				failure : function() {
					alert(Ext.getCmp('nombre').getValue());
					Ext.Msg.alert("Mensaje", "Servidor no conectado");

				}
			});
		}

		function buscar_marca() {
			Ext.Ajax.request({
				url : 'menu_admin/buscar_marca',
				params : {
					ajax : 'true',
					funcion : 'buscar_marca',
					nombre : Ext.getCmp('nombre').getValue(),
				},
				//Retorno exitoso de la pagina servidora a traves del formato JSON
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito.responseText);
					if (datos.exito == 'true') {
						Ext.getCmp('nombre').setValue(datos.nombre);
						Ext.getCmp('imagen').setValue(datos.imagen);
						Ext.getCmp('mision').setValue(datos.mision);
						Ext.getCmp('vision').setValue(datos.vision);
						Ext.getCmp('valores').setValue(datos.valores);
						Ext.getCmp('contacto').setValue(datos.contacto);
						Ext.getCmp('btnregistrar').disable(false);
						Ext.getCmp('imagen0').setSrc(Ext.getCmp('imagen').getValue());
					} else {
						Ext.Msg.alert("Error", datos.msg);
						Ext.getCmp('btnregistrar').enable(false);
						Ext.getCmp('btneliminar').disable(true);
					}
				},
				//No hay retorno de la pagina servidora
				failure : function() {
					alert(Ext.getCmp('nombre').getValue());
					Ext.Msg.alert("Error", "Servidor no conectado");

				}
			});
			//Ext.getCmp('btnregistrar').disable(false);
			Ext.getCmp('nombre').focus();

		}


		me.callParent(arguments);
	}
});

