var marcaStore = null;
var data = null;
Ext.define('VentanaMarca', {
	extend : 'Ext.window.Window',

	height : 549,
	id : 'ventanamarca',
	width : 561,
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
					listeners: {
                      specialkey: function(field, e){
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
					x : 180,
					y : 350,
					text : 'Cancelar',
					id : 'cancelar',
					listeners : {
						click : function() {
							Ext.getCmp('formulariomarca').getForm().reset();
						}
					}
				}, {
					xtype : 'button',
					x : 270,
					y : 350,
					text : 'Registrar',
					tooltip : 'Registrar una Marca',
					id : 'btnregistrar',
					listeners:{
						click:function(){
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
					Ext.Msg.alert("Exito", "Se ha Guardado la Marca!!");
					Ext.getCmp('formulariomarca').getForm().reset();
					datos = Ext.JSON.decode(exito, reponseText);
				},
				failure : function() {
					Ext.Msg.alert("Error", "Servidor NO Conectado!!");
				}
			});
		}
		//metodo seleccionar marca
		function seleccionar_marca(){
			
		}
		
		function buscar_marca() {
			Ext.Ajax.request({
				url : 'menu_admin/buscar_marca',
				params : {
					ajax : 'true',
					funcion : 'buscar_marca',
					nombre : Ext.getCmp('nombre').getValue()
				},
				//Retorno exitoso de la pagina servidora a traves del formato JSON
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito.responseText);
					if (datos.exito == 'true') {
						Ext.getCmp('imagen').setValue(datos.imagen);
						Ext.getCmp('mision').setValue(datos.mision);
						Ext.getCmp('vision').setValue(datos.vision);
						Ext.getCmp('valores').setValue(datos.valores);
						Ext.getCmp('contacto').setValue(datos.contacto);
					} else {
						Ext.Msg.alert("Error", datos.msg);
					}
				},
				//No hay retorno de la pagina servidora
				failure : function() {
					alert(Ext.getCmp('nombre').getValue());
					Ext.Msg.alert("Error", "Servidor no conectado");
					
				}
			});
			Ext.getCmp('nombre').focus();

		}


		me.callParent(arguments);
		}
		});

