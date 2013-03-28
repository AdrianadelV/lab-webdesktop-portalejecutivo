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
	url: 'concesionario/generarmenu?tipo=3'
	},
	root: {
	text: 'Concesionario',
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

 ventanaindicadores = Ext.create('indicadoreseje');
	ventanaindicadores.show();
	// ventana = Ext.create('edopedidoensamb');
	// ventana.show();

 var tree = Ext.create('Ext.tree.Panel', {
	 store : store,
	 renderTo : 'tree_el',
	 height : 400,
	 width : 300,
	 collapsible : true,
	 title : 'Menu A.E.V.E.V ',
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
			 if (node.get('text') == "Estado de la Proforma"){
				 ventana.close();
				 ventana = Ext.create('edoproforma');
				 ventana.show();
			 }
			 if (node.get('text') == "Lista de Espera"){
				 ventana.close();
				 ventana = Ext.create('miVentanalista');
				 ventana.show();
			 }
			 if (node.get('text') == "Registrar Planes de Servicios"){
				 ventana.close();
				 ventana = Ext.create('registrarservicios');
				 ventana.show();
			 }
			 if (node.get('text') == "Estado de Pedidos a la Ensambladora"){
				 ventana.close();
				 alert("PASO");
				 ventana =Ext.create('edopedidoensamb');
				 ventana.show();
				 alert("PASO2");
			 }if (node.get('text') == "Configurar nuevo Indicador"){
				 ventana.close();
				 ventana =Ext.create(miVentanaIndicadores);
				 ventana.show();
			 }
		 }
	 }

 });
   // ventana = Ext.create('listaespera');
	//ventana.show();

});