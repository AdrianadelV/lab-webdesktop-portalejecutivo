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
					enableKeyEvents : true,
					minLength : 1,
					vtype : 'alphanum',
					id : 'nombre'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 100,
					width : 360,
					id : 'imagen',
					fieldLabel : 'Imagen'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 150,
					width : 360,
					id : 'mision',
					fieldLabel : 'Mision'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 200,
					width : 360,
					id : 'vision',
					fieldLabel : 'Vision'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 250,
					width : 360,
					id : 'valores',
					fieldLabel : 'Valores'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 300,
					width : 360,
					id : 'contacto',
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


		me.callParent(arguments);
	}
});
