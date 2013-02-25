Ext.define('indicadoreseje', {
	extend : 'Ext.window.Window',

	height : 500,
	width : 320,
	collapsible : true,
	y : 207,
	x : 1035,
	autoScroll : true,
	layout : {
		type : 'absolute'
	},
	title : 'Indicadores',

	initComponent : function() {
		var me = this;

		Ext.applyIf(me, {
			items : [{
				xtype : 'label',
				x : 45,
				y : 30,
				border : 'solid',
				width : 140,
				heigth : 80,
				text : 'Ingreso en Bolivares de Vehiculos Vendidos por Marca Ford'
			}, {
				xtype : 'label',
				x : 45,
				y : 115,
				height : 80,
				width : 140,
				text : 'Numero de Vehiculos Vendidos por Marca'
			}, {
				xtype : 'label',
				x : 45,
				y : 195,
				height : 80,
				width : 140,
				text : 'Promedio de Vehiculos Ensamblados'
			}, {
				xtype : 'button',
				x : 205,
				y : 30,
				text : 'Detalles',
				listeners : {
					click : function() {
						ventana_ind = Ext.create('indicadoresdeta');
						ventana_ind.show();
					}
				}
			}, {
				xtype : 'button',
				x : 205,
				y : 115,
				text : 'Detalles',
				listeners : {
					click : function() {
						ventana_ind = Ext.create('indicadoresdeta');
						ventana_ind.show();
					}
				}
			}, {
				xtype : 'button',
				x : 205,
				y : 195,
				text : 'Detalles',
				listeners : {
					click : function() {
						ventana_ind = Ext.create('indicadoresdeta');
						ventana_ind.show();
					}
				}
			}, {
				x : 10,
				y : 30,
				height : 28,
				width : 27,
				html : '<div align="left"><img src="images/rojo.jpg""></div>'
			}, {
				x : 10,
				y : 115,
				height : 28,
				width : 27,
				html : '<div align="left"><img src="images/amarillo.jpg""></div>'
			}, {
				x : 10,
				y : 195,
				height : 28,
				width : 27,
				html : '<div align="left"><img src="images/amarillo.jpg""></div>'
			}]
		});

		me.callParent(arguments);
	}
}); 