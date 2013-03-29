//Calcular las posiciones x,y segun la resolucion del monitor del cliente para el tabpanel por ser un layout absolute
var posx = 0;
var posy = 0;
var factorw = 0.001;
var factorh = 0.10;
//1024x768
if (screen.width == 1024 && screen.height == 768) {
	factorw = 0.025;
	factorh = 0.10;
}
//1280x800
if (screen.width == 1280 && screen.height == 800) {
	factorw = 0.080;
	factorh = 0.10;
}
//1280x1024
if (screen.width == 1280 && screen.height == 1024) {
	factorw = 0.020;
	factorh = 0.005;
}
posx = parseInt(screen.width * factorw);
posy = parseInt(screen.height * factorh);

Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup', 'Ext.panel.Panel']);
Ext.require('Ext.chart.*');
Ext.require(['Ext.Window', 'Ext.layout.container.Fit', 'Ext.fx.target.Sprite', 'Ext.window.MessageBox']);

Ext.onReady(function() {
	Ext.QuickTips.init();
	var store = Ext.create('Ext.data.TreeStore', {
		proxy : {
			type : 'ajax',
			url : 'cli_comprador/generarmenu?tipo=4'
		},
		root : {
			text : 'Menu Principal',
			id : 'root_node',
			expanded : true
		},
		folderSort : false,
		sorters : [{
			property : 'id',
			direction : 'ASC'
		}],
	});
	ventana = Ext.create('miVentanalista');
	ventana.show();

	ventanaindicadores = Ext.create('indicadoreseje');
	ventanaindicadores.show();

	var tree = Ext.create('Ext.tree.Panel', {
		store : store,
		renderTo : 'tree_el',
		height : 500,
		width : 300,
		collapsible : true,
		title : 'Menu AEVEV ',
		layuot : 'Accordion',
		dockedItems : [{
			xtype : 'toolbar',
			items : [{
				text : 'Opciones',
				handler : function() {
					tree.expandAll();
				}
			}]
		}],
		useArrows : true,
		listeners : {
			itemclick : function(view, node) {
				if (node.get('text') == "Actualizar Datos Personales") {
					ventana.close();
					ventana = Ext.create('actualizar');
					ventana.show();
					buscar_comprador();
				}
				if (node.get('text') == "Lista de Espera") {
					ventana.close()
					ventana = Ext.create('miVentanalista');
					ventana.show();
				}
				if (node.get('text') == "Anular Pedido") {
					ventana.close();
					ventana = Ext.create('anularpedido');
					ventana.show();
				}
				if (node.get('text') == "Proforma") {
					ventana.close();
					ventana = Ext.create('proformas');
					ventana.show();
				}
				if (node.get('text') == "Proforma") {
					ventana.close();
					ventana = Ext.create('proforma_banco');
					ventana.show();
					buscar_comprador(); 
					var currentDate = new Date();
					Ext.getCmp('fecha2').setValue(currentDate);
				    var day=currentDate.getDate();
				    // el mes es devuelto entre 0 y 11
				    var month=currentDate.getMonth()+1;
				    var year=currentDate.getFullYear();
				    
					var tiempo=currentDate.getTime();
				    //Calculamos los milisegundos sobre la fecha que hay que sumar o restar...
				    var milisegundos=parseInt(30*24*60*60*1000);
				    //Modificamos la fecha actual
				    var total=currentDate.setTime(tiempo+milisegundos);
				    day=currentDate.getDate();
				    month=currentDate.getMonth()+1;
				    year=currentDate.getFullYear();
				    currentDate.setDate(day);
				    currentDate.setMonth(month);
				    currentDate.setYear(year);			
					Ext.getCmp('validez').setValue(currentDate);		
				}
				if (node.get('text') == "Comprar Vehiculo") {
					ventana.close();
					ventana = Ext.create('comprarvehiculo');
					ventana.show();
				}
				if (node.get('text') == 'Configurar Nuevo Indicador') {
					ventana.close();
					ventana = Ext.create('mipanelejecutivo', {
						renderTo : 'tree_el',
						title : node.get('text'),
					});
				}
				if (node.get('text') == "Galeria") {
					ventana.close();
					ventana = Ext.create('miVentanaGaleria');
					ventana.show();
					
				}
				
			}
		}
	});

	// ventana = Ext.create('listaespera');
	//ventana.show();

});

function editCuentaUsuario() {
		ventana.close();
		ventana = Ext.create('actualizar');
		buscar_comprador();
		ventana.show();
	}
