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

var data = null;
var ventana = null;
var boton = null;

	Ext.require([
	         	'Ext.tree.*',
	         	'Ext.data.*',
	         	'Ext.tip.*',
				'Ext.container.Viewport',
    			'Ext.container.ButtonGroup',
    			'Ext.panel.Panel'
	         ]);
	         
	//Definicion del Moelo
	Ext.define('Proforma', {
		extend : 'Ext.data.Model',
		fields : ['nro_pedido', 'tipo_vehiculo', 'modelov', 'cantidad', 'color', 'fecha', 'fechaentrega', 'estatus']
	});

	//Definicion del Data Store
	var proformaStore = Ext.create('Ext.data.Store', {
		model : 'EstadoPedidoEn',
		data : [{
			nro_pedido : '00099',
			tipo_vehiculo : 'Camioneta',
			modelov : 'Chevrolet Vitara 2.0 litros 4 ptas',
			cantidad : '7770182',
			color : 'Azul',
			fecha : '01/02/2013',
			fechaentrega : '01/03/2013',
			estatus : 'En Proceso'
		}, {
			nro_pedido : '000100',
			tipo_vehiculo : 'Sedan',
			modelov : 'Chevrolet Aveo 1.6 lts 4 ptas',
			cantidad : '10',
			color : 'Plateado',
			fecha : '02/02/2013',
			fechaentrega : '02/03/2013',
			estatus : 'En Proceso'
		}, {
			nro_pedido : '000101',
			tipo_vehiculo : 'Sedan',
			modelov : 'Chevrolet Corsa 2.0 lts 4 ptas',
			cantidad : '5',
			color : 'Rojo ferrari',
			fecha : '03/02/2013',
			fechaentrega : '03/03/2013',
			estatus : 'En Proceso'
		}, {
			nro_pedido : '000105',
			tipo_vehiculo : 'Camioneta',
			modelov : 'Chevrolet Vitara',
			cantidad : '7',
			color : 'verde',
			fecha : '16/02/2013',
			fechaentrega : '------',
			estatus : 'En Proceso'
		}]
	}); 

	//Definicion de la clase UsuariosGrid
	Ext.define('edoensambgrid', {
		extend : 'Ext.grid.Panel',
		//Definicion del alias que puede usado en un xtype
		alias : 'widget.edoensambgrid',

		//Sobre escribimos este metodo de Ext.grid.Panel
		initComponent : function() {
			//Definicion de las columnas del grid
			this.columns = [{
				xtype : 'rownumberer',
				width : 40,
				sortable : false
			}, {
				text : "Nro Pedido",
				width : 60,
				dataIndex : 'nro_pedido',
				sortable : true
			}, {
				text : "Tipo de Vehiculo",
				flex : 90,
				dataIndex : 'tipo_vehiculo',
				sortable : true
			}, {
				text : "Modelo Vehiculo",
				width : 100,
				dataIndex : 'modelov',
				sortable : true
			}, {
				text : "Cantidad",
				width : 100,
				dataIndex : 'cantidad',
				sortable : true
			}, {
				text : "Color",
				width : 100,
				dataIndex : 'color',
				sortable : true
			}, {
				text : "Fecha",
				width : 100,
				dataIndex : 'fecha',
				sortable : true
			}, {
				text : "Fecha entrega",
				width : 100,
				dataIndex : 'fechaentrega',
				sortable : true
			}, {
				text : "Estatus",
				width : 100,
				dataIndex : 'estatus',
				sortable : true
			}];
			// Origen de los datos, de un data store
			this.store = proformaStore;
			this.forceFit = true;
			this.scroll = false;
			this.viewConfig = {
				style : {
					overflowY : 'hidden',
					overflowX : 'hidden'
				}
			};
			//this.verticalScroller = {xtype: 'paginggridscroller'};
			this.listeners = {
				itemclick : function() {
					data = this.getSelectionModel().selected.items[0].data;
					//alert(data.usuario);
				}
			};
			//Llamamos a la super clase a iniciacion del componente
			App.UsuariosGrid.superclass.initComponent.call(this);
		}
	}); 

//Definicion de la ventana contendora del grid
	Ext.define('edopedidoensamb', {
		extend : 'Ext.window.Window',

		layout : 'absolute',
		x : 400,
		y : 210,
		width : 600,
		height : 350,
		closeAction : 'hide',		plain : true,
		closable : true,
		colapsable : true,
		resizable : true,
		maximizable : true,
		minimizable : true,
		modal : false,
		title : 'Estado de la Proforma',
		buttonAlign : 'center',
		renderTo: 'tree_el',
		constrain : true,
		initComponent: function() {
			var me = this;
			Ext.applyIf(me, {
	
				items : [{
					xtype : 'edoensambgrid'
				}]
			});
			me.callParent(arguments);
		}
	}); 