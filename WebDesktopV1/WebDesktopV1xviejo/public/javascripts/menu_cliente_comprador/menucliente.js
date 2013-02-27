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
	proxy: {
	type: 'ajax',
	url: 'cli_comprador/generarmenu?tipo=3'
	},
	root: {
	text: 'Menu Principal',
	id: 'root_node',
	expanded: true
	},
	folderSort: false,
	sorters: [{
	property: 'id',
	direction: 'ASC'
	}],
});
ventana = Ext.create('miVentanalista');
ventana.show();

var tree = Ext.create('Ext.tree.Panel', {
	store : store,
	renderTo : 'tree_el',
	height : 500,
	width : 330,
	collapsible : true,
	title : 'Menu AEVEV ',
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
			}
			if (node.get('text') == "Lista de Espera")
			 {
				ventana.close()
				ventana = Ext.create('miVentanalista');
				ventana.show();
			}
			if (node.get('text') == "Ford") // (node.get('Text') == "Fiat") )//|| node.get('Text') == "Daewood" || node.get('Text') == "Toyota" || node.get('Text') == "Huyndai")
			 {
				ventana.close();
				ventana =Ext.create('catalogo');
				ventana.show();
			}
			if (node.get('text') == "Fiat")
			{
				ventana.close();
				ventana =Ext.create('catalogo');
				ventana.show();
			}
			if (node.get('text') == "Daewood")
			{
				ventana.close();
				ventana =Ext.create('catalogo');
				ventana.show();
			}
			if (node.get('text') == "Toyota")
			{
				ventana.close();
				ventana =Ext.create('catalogo');
				ventana.show();
			}
			if (node.get('text') == "Huyndai")
			{
				ventana.close();
				ventana =Ext.create('catalogo');
				ventana.show();
			}
			if (node.get('text') == "Anular Pedido")
			 {
				ventana.close();
				ventana =Ext.create('anularpedido');
				ventana.show();
			}
			if (node.get('text') == "Proforma")
			 {
				ventana.close();
				ventana =Ext.create('proformas');
				ventana.show();
			 }
			if (node.get('text') == "Comprar Vehiculo") 
			{
				ventana.close();
				ventana = Ext.create('comprarvehiculo');
				ventana.show();
			}
		}
	}
});

   // ventana = Ext.create('listaespera');
	//ventana.show();

});