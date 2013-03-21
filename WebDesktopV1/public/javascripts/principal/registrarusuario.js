alert("se llamo");

Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup', 'Ext.panel.Panel']);

Ext.onReady(function() {

	alert("paso a crearlo");

	Ext.QuickTips.init();
	Ext.define('VentaRegistrarUsuario', {
		extend : 'Ext.window.Window',

		height : 549,
		id : 'ventanacomprador',
		width : 661,
		x : 380,
		y : 225,
		layout : {
			type : 'absolute'
		},
		title : 'Registrar comprador',
		//initComponent : function() {
		//aqui con este se daña

		//var me = this;

		//Ext.applyIf(me, {

		items : [{
			xtype : 'form',

			autoRender : true,
			height : 420,
			id : 'formulariocomprador',
			layout : {
				type : 'absolute'
			},
			bodyPadding : 10,
			title : '',
			items : [
				{
				xtype : 'textfield',
				x : 0,
				y : 70,
				width : 200,
				fieldLabel : 'Cedula',
				id : 'cedula'
				}, {
				xtype : 'textfield',
				x : 0,
				y : 110,
				width : 290,
				fieldLabel : 'Nombres',
				id : 'nombres'
				}, {
				xtype : 'textfield',
				x : 0,
				y : 150,
				width : 290,
				fieldLabel : 'Apellidos',
				id : 'apellidos'
				}, {
				xtype : 'textfield',
				x : 0,
				y : 190,
				width : 250,
				fieldLabel : 'Telefono',
				id : 'telefono'
				}, {
				xtype : 'textfield',
				x : 260,
				y : 150,
				fieldLabel : 'Correo',
				id : 'correo'
				}, {
				xtype : 'textfield',
				x : 260,
				y : 190,
				fieldLabel : 'Repetir Correo',
				id : 'correo2'
				}, {
				xtype : 'textfield',
				x : 0,
				y : 230,
				width : 430,
				fieldLabel : 'Direccion',
				id : 'direccion'
				}, {
				xtype : 'datefield',
				x : 260,
				y : 70,
				fieldLabel : 'Fecha de nacimiento',
				id : 'fecha_nacimiento'
				}, {
				xtype : 'combobox',
				x : 260,
				y : 110,
				width : 200,
				fieldLabel : 'Sexo',
				id : 'sexo'
				}, {
				xtype : 'textfield',
				x : 0,
				y : 260,
				fieldLabel : 'Nombre de usuario',
				id : 'nusuario'

				}, {
				xtype : 'textfield',
				x : 0,
				y : 300,
				fieldLabel : 'Contraseña',
				id : 'password'

				}, {
				xtype : 'textfield',
				x : 0,
				y : 330,
				fieldLabel : 'Repetir contraseña',
				id : 'password2'
				}, {
				xtype : 'button',
				x : 440,
				y : 300,
				text : 'Registrar',
				listeners : {
					click : function() {
						alert('pse por el boton');

						grabar_comprador();
					}
				},
				//url:'inicio'
				}, {
				xtype : 'button',
				x : 360,
				y : 300,
				text : 'Cancelar',
				listeners : {
					click : function() {
						Ext.getCmp('formulariocomprador').getForm().reset();
					}
				}
			}]
		}]

		//} ) aplyif me
		//} del in component

	});
	ventanaregistrarusuario = Ext.create('VentaRegistrarUsuario')
	ventanaregistrarusuario.show();
})