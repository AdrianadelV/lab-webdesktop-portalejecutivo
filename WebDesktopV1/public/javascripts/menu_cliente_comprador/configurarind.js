  //Calcular las posiciones x,y segun la resolucion del monitor del cliente para el tabpanel por ser un layout absolute
   var posx = 0;
   var posy = 0;
   var factorw = 0.001;
   var factorh = 0.10;
   //1024x768
   if (screen.width==1024 && screen.height==768)
   {
    factorw = 0.025;
    factorh = 0.10;
   }
   //1280x800
   if (screen.width==1280 && screen.height==800)
   {
    factorw = 0.080;
    factorh = 0.10;
   }
   //1280x1024
   if (screen.width==1280 && screen.height==1024)
   {
    factorw = 0.020;
    factorh = 0.005;
   }
posx = parseInt(screen.width * factorw);
posy = parseInt(screen.height * factorh);

Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*'
	         ]);		
		
		var marca = new Ext.data.SimpleStore({
		    fields: ['id', 'marca'],
		    data : [['1','Ford'],['2','Daewood'],['3','Toyota'],['4','Fiat']]
		});
		
		var modelo= new Ext.data.SimpleStore({
		    fields: ['id', 'modelo'],
		    data : [['1','Get'],['2','Elantra'],['3','Genesis'],['4','Azera']]
		});
		
		var indicador= new Ext.data.SimpleStore({
		    fields: ['id', 'indicador'],
		    data : [['1','Numero de Vehículos vendidos por marca'],['2','Numero de vehículos vendidos x marca'],['3','Numero de damas que compran vehículos de X marca'],['4','Numero de caballeros que compran  vehículos de x marca x modelo'],['5','Numero de vehículos vendidos de x marca x modelo x color'],['6','Numero de vehículos ensamblados'],['7','Ingreso en bolívares de vehículos vendidos de x marca'],['8','Ingreso en bolívares de vehículos vendidos de x marca x modelo'],['9','Ingreso en bolívares de las damas que compran vehículos de x marca'],['10','Ingreso en bolívares de caballeros que compran vehículos de x marca X modelo'],['11','Ingreso en bolívares de vehículos vendidos de X  marca X color'],['12','Promedio de Vehículos vendidos por x marca']]
		});
		
		Ext.define('mipanelejecutivo', {
					extend : 'Ext.panel.Panel',
					x:325,
					y:-500,
					closable:true,
					collapsible:true,
					height : 500,
					width : 705,
					layout : {
						type : 'absolute'
					},
			
				initComponent : function() {
				var me = this;
				Ext.applyIf(me, {
					items :[
					{
						xtype : 'combobox',
						x : 30,
						y : 20,
						width : 610,
						mode: 'indicador',
  					    store: indicador,
     					displayField:'indicador',
						fieldLabel : 'Selecione Indicador'
					}, {
						xtype : 'label',
						x : 30,
						y : 80,
						height : 20,
						text : 'Opciones'
					}, {
						xtype : 'combobox',
						x : 19,
						y : 119,
						name: 'marca_combo',
                        mode: 'local',
  					    store: marca,
     					displayField:'marca',
						fieldLabel : 'Marca'
					}, {
						xtype : 'combobox',
						x : 360,
						y : 120,
						name: 'modelo_combo',
                        mode: 'local',
  					    store: modelo,
     					displayField:'modelo',
						fieldLabel : 'Modelo'
					}, {
						xtype : 'label',
						x : 100,
						y : 170,
						text : 'Rango de Valores'
					}, {
						xtype : 'label',
						x : 400,
						y : 172,
						height : 10,
						width : 120,
						text : 'Rango de Fecha'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 210,
						fieldLabel : 'Rojo Inicio'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 260,
						fieldLabel : 'Rojo Fin'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 310,
						fieldLabel : 'Amarillo Inicio'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 360,
						fieldLabel : 'Amarillo Fin'
					}, {
						xtype : 'textfield',
						x : 20,
						y : 410,
						fieldLabel : 'Verde Inicio'
					}, {
						xtype : 'datefield',
						x : 380,
						y : 210,
						width : 310,
						fieldLabel : 'Fecha Inicio'
					}, {
						xtype : 'datefield',
						x : 380,
						y : 260,
						width : 310,
						fieldLabel : 'Fecha Fin'
					}, {
						xtype : 'textfield',
						x : 380,
						y : 310,
						width : 310,
						fieldLabel : 'Responsable'
					}, {
						xtype : 'button',
						x : 620,
						y : 410,
						text : 'Guardar'
					}, {
						xtype : 'button',
						x : 510,
						y : 410,
						text : 'Cancelar'
					}]
				});
				me.callParent(arguments);
			}		
		}); 