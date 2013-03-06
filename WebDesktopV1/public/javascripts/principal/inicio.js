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

	         Ext.onReady(function() {
	         	Ext.QuickTips.init();
	         	
	         	var store = Ext.create('Ext.data.TreeStore', {
	         		proxy: {
	         			type: 'ajax',
	         			url: 'inicio/generarmenu?tipo=2'
	         		},
	         		root: {
	         			text: 'Marca',
	         			id: 'root_node',
	         			expanded: true
	         		},
	         		folderSort: false,
	         		sorters: [{
	         			property: 'id',
	         			direction: 'ASC'
	         		}]
	         	});
			
				// Ext.define('MyApp.view.MyTabPanel', {
					// extend : 'Ext.tab.Panel',
					// x:325,
					// y:-500,
					// height : 530,
					// width : 800,
					// closable:true,
					// collapsible:true,
					// activeTab : 0,
					// layout:'absolute',
					// items : [{
								// xtype : 'panel',
								// title : 'Quienes Somos',
								// html  :	'<h1></h1><div align="center"><img src="images/quienes.png""></div>'
							// }, {
								// xtype : 'panel',
								// title : 'Concesionarios',
								// //html  : '<h1></h1><h1></h1><div align="center"><img src="images/mapa_mundi.png""></div>'
								// html  : '<iframe width="700" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.es/maps?f=d&amp;source=s_d&amp;saddr=Venezuela&amp;daddr=&amp;hl=es&amp;geocode=&amp;aq=0&amp;oq=vene&amp;sll=40.396764,-3.713379&amp;sspn=8.766144,21.643066&amp;mra=ls&amp;num=10&amp;ie=UTF8&amp;ll=6.42375,-66.58973&amp;spn=17.780303,17.893559&amp;t=m&amp;output=embed"></iframe><br /><small><a href="https://maps.google.es/maps?f=d&amp;source=embed&amp;saddr=Venezuela&amp;daddr=&amp;hl=es&amp;geocode=&amp;aq=0&amp;oq=vene&amp;sll=40.396764,-3.713379&amp;sspn=8.766144,21.643066&amp;mra=ls&amp;num=10&amp;ie=UTF8&amp;ll=6.42375,-66.58973&amp;spn=17.780303,17.893559&amp;t=m" style="color:#0000FF;text-align:left">Ver mapa más grande</a></small>',
							// }, {
								// xtype : 'panel',
								// title : 'Contacto',
								// html  : '<h1>Contáctanos</h1><p>Numero Telefonico: 0251-3457869, 0426-6542322 y 0424-6754499.</p><p>Numero-Fax: 0251-9887652</p><p>Correo: empresa_marca@gmail.com</p>'
// 								
							// },{
								// stype : 'panel',
								// title : 'Galeria de Vehiculos',
									// items:[{
											// xtype : 'form',
											// height : 600,
											// width : 900,
											// bodyPadding : 10,
											// items : [{
							                    // xtype: 'tabpanel',
							                    // activeTab: 0,
							                    // height : 600,
												// width : 800,
							                    // html:'<iframe  height="600" width="800" src="catalogo_old.html"></iframe>'
							                // }]
										// }]								
							// }]
				// }); 
				 				
				
	         	var tree = Ext.create('Ext.tree.Panel', {
	         		store: store,
	         		renderTo: 'tree_el',
	         		//region:'center',
	         		x:0,
	         		y:0,
	         		height:500,
	         		width: 300,
	         		//collapsible: true,
	         		title: 'Menu A.E.V.E.V',
	         		dockedItems : [{
						xtype : 'toolbar',
						items : [{
							text : 'Opciones',
							handler : function() {
							tree.expandAll();
							}
						}]
					}],
	         		useArrows: true,
	                         // listeners: {
	                       		// itemclick:function(view,node){
	                       			// if(node.get('text')=='Conocenos Ford'){
	                       			 // Ext.create('MyApp.view.MyTabPanel', {
									 // renderTo : 'tree_el',
									 // title:'Conocenos Ford'
								   // });
	                       		// }
	                       		// if(node.get('text')=='Conocenos Daewood'){
	                       			 // Ext.create('MyApp.view.MyTabPanel', {
									 // renderTo : 'tree_el',
									 // title:'Conocenos Daewood'
								   // });
	                       		// }
	                       		// if(node.get('text')=='Conocenos Chevroleth'){
	                       			 // Ext.create('MyApp.view.MyTabPanel', {
									 // renderTo : 'tree_el',
									 // title:'Conocenos Chevroleth'
								   // });
	                       		// }
	                       		// if(node.get('text')=='Conocenos Hyundai'){
	                       			 // Ext.create('MyApp.view.MyTabPanel', {
									 // renderTo : 'tree_el',
									 // title:'Conocenos Hyundai'
								   // });
	                       		// }
	                       		// if(node.get('text')=='Conocenos Toyota'){
	                       			 // Ext.create('MyApp.view.MyTabPanel', {
									 // renderTo : 'tree_el',
									 // title:'Conocenos Toyota'
								   // });
	                       		// }
	                       // }
	                  // }
	         	});
	         });