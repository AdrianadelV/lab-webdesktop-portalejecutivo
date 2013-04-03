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
			url : 'menu_ensambladora/generar_menu?tipo=1'
		},
		root : {
			text : 'Ensambladora',
			id : 'root_node',
			expanded : true,
		},
		folderSort : false,
		sorters : [{
			property : 'id',
			direction : 'ASC'
		}]
	});

	// ventana = Ext.create('miVentanalista');
	// ventana.show();
	
	buscar_usuarioLogueado();	
	ventanaindicadores = Ext.create('indicadoreseje');
	ventanaindicadores.show();

	// ventana = Ext.create('catalogo');
	// ventana.show();

	var tree = Ext.create('Ext.tree.Panel', {
		store : store,
		// store : bd,
		title : 'Opciones',
		//layout: 'accordion',
		renderTo : 'tree_el',
		height : 350,
		width : 320,
		title : 'Menu A.E.V.E.V',
		collapsible : true,
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
				if (node.get('text') == "Registrar o Modificar Nuevos Vehiculos") {
					//ventana.close();
					//ventana = Ext.create('miVetanaRegistrar');
					//ventana.show();
					alert('Modulo en construccion');
				}
				if (node.get('text') == "Listado de Pedidos por Concesionario") {
					// ventana.close();
					// ventana = Ext.create('miVentanalista');
					// ventana.show();
				}
				if (node.get('text') == 'Configurar Nuevo Indicador') {
					// ventana.close();
					ventana = Ext.create('miVentanaIndicadores');
					ventana.show();
				}
				if (node.get('text') == "Registrar Modelo de Vehiculo") {
					ventana.close();
					ventana = Ext.create('miVentanaModelo');
					ventana.show();
				}
			}
		}
	});
});

// function buscar_usuarioLo() {
	// Ext.Ajax.request({
		// url : '/menu_ensambladora/buscar_usuario',
		// params: {
			  // ajax : 'true',
			  // funcion : 'buscar_usuario',
		      // nombre: document.getElementById("user_name").textContent,
		   // },
		// //Retorno exitoso de la pagina servidora a traves del formato JSON
		// success : function(exito, request) {
			// datos = Ext.JSON.decode(exito.responseText);
			// if (datos.exito == 'false') {
				// Ext.Msg.alert("Error", datos.msg);
			// } else {
				// rols_id=datos.rols_id;
				// alert(rols_id);
			// }
		// },
		// //No hay retorno de la pagina servidora
		// failure : function() {
			// Ext.Msg.alert("Error", "Servidor no conectado buscar rols");
		// }
	// });
// }