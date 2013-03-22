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
			url : 'menu_admin/generar_menu?tipo=5'
		},
		root : {
			text : 'Administrador',
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
		height : 270,
		width : 300,
		title : 'Menu',
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
				if(node.get('text') == "Registrar Ensambladora"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('VentanaEnsambladoraAdmin');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Registrar Marca"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('VentanaMarca');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Registrar Concesionario"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('VentanaConcesionarioAdmin');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Lista de Espera de Pedido"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('miVentanalista');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Listado de Concesionarios"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('miVentanalistaconcesionario');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Listado de Ensambladoras"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('miVentanalistaEnsambladora');
                  	ventanaacttiva.show();
				}
				if(node.get('text') == "Listado de Marcas"){
					ventanaacttiva.close();
					ventanaacttiva = Ext.create('miVentanalistamarca');
                  	ventanaacttiva.show();
				}
			}
		}
	});
});