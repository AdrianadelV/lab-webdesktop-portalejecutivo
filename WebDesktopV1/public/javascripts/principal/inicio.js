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

Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*']);

Ext.onReady(function() {
	Ext.QuickTips.init();

	var store = Ext.create('Ext.data.TreeStore', {
		proxy : {
			type : 'ajax',
			url : 'inicio/generarmenu'
		},
		root : {
			text : 'Marca',
			id : 'root_node',
			expanded : true
		},
		folderSort : false,
		sorters : [{
			property : 'id',
			direction : 'ASC'
		}]
	});

	Ext.define('MyApp.view.MyTabPanel', {
		extend : 'Ext.tab.Panel',
		x : 325,
		y : -500,
		height : 530,
		width : 800,
		closable : true,
		collapsible : true,
		activeTab : 0,
		layout : 'absolute',

	});

	var tree = Ext.create('Ext.tree.Panel', {
		store : store,
		renderTo : 'tree_el',
		//region:'center',
		x : 0,
		y : 0,
		height : 500,
		width : 300,
		//collapsible: true,
		title : 'Menu A.E.V.E.V',
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
				buscar(node.get("id"));
			}
		}

	});
}); 