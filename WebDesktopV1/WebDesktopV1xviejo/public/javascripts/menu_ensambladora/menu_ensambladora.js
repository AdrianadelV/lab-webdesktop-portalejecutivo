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

Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup', 'Ext.panel.Panel']);

Ext.onReady(function() {
	Ext.QuickTips.init();
	
	var store = Ext.create('Ext.data.TreeStore', {
		proxy : {
			type : 'ajax',
			url : 'menu_ensambladora/generar_menu?tipo=2'
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

 ventanaacttiva = Ext.create('miVentanalista');
                  ventanaacttiva.show();

	var tree = Ext.create('Ext.tree.Panel', {
		store : store,
		title : 'Opciones',
		// layout: 'accordion',
		renderTo : 'tree_el',
		height : 230,
		width : 330,
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
				if(node.get('text') == "Registrar Nuevos Vehiculos"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('miVentana');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Modificar o Eliminar Modelo"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('miVentanaModificar');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Listado de Pedidos por Concesionario"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('miVentanalista');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Registrar Concesionario"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('miVentanaConcesionario');
                  	ventanaacttiva.show();
				}
			}
		}
	});
});
