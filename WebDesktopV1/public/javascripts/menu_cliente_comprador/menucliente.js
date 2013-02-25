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
			url : 'cli_comprador/generarmenu?tipo=3'
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
		width : 315,
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
				}
				if (node.get('text') == "Lista de Espera") {
					ventana.close()
					ventana = Ext.create('miVentanalista');
					ventana.show();
				}
				if (node.get('text') == "Ford")// (node.get('Text') == "Fiat") )//|| node.get('Text') == "Daewood" || node.get('Text') == "Toyota" || node.get('Text') == "Huyndai")
				{
					ventana.close();
					ventana = Ext.create('catalogo');
					ventana.show();
				}
				if (node.get('text') == "Fiat") {
					ventana.close();
					ventana = Ext.create('catalogo');
					ventana.show();
				}
				if (node.get('text') == "Daewood") {
					ventana.close();
					ventana = Ext.create('catalogo');
					ventana.show();
				}
				if (node.get('text') == "Toyota") {
					ventana.close();
					ventana = Ext.create('catalogo');
					ventana.show();
				}
				if (node.get('text') == "Huyndai") {
					ventana.close();
					ventana = Ext.create('catalogo');
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
				if (node.get('text') == "Comprar Vehiculo") {
					ventana.close();
					ventana = Ext.create('comprarvehiculo');
					ventana.show();
				}
				if(node.get('text')=='Configurar Nuevo Indicador'){
					ventana.close();
					ventana = Ext.create('mipanelejecutivo', {
				    renderTo : 'tree_el',
				    title:node.get('text'),
				 	});	
				}
				if(node.get('text')=='Promedio de Vehiculos Ensamblados'){
								 	ventana.close();
									var chart = Ext.create('Ext.chart.Chart', {
							             id: 'chartCmp',
							             xtype: 'chart',
							             style: 'background:#fff',
							             width: 400,
							             height: 350,
							             animate: true,
							             shadow: true,
							             store: store1,
							             axes: [{
							                 type: 'Numeric',
							                 position: 'left',
							                 fields: ['data1'],
							                 label: {
							                     renderer: Ext.util.Format.numberRenderer('0,0')
							                 },
							                 title: 'Promedio de Vehiculos Ensamblados',
							                 grid: true,
							                 minimum: 0
							             }, {
							                 type: 'Category',
							                 position: 'bottom',
							               	 fields: ['name'],
							                 title: 'Meses del año'
							             }],
							             series: [{
							                 type: 'column',
							                 axis: 'left',
							                 highlight: true,
							                 tips: {
							                   trackMouse: true,
							                   width: 140,
							                   height: 28,
							                   renderer: function(storeItem, item) {
							                     this.setTitle(storeItem.get('name') + ': ' + storeItem.get('data1') + ' $');
							                  }
							                 },
							                 label: {
							                   display: 'insideEnd',
							                   'text-anchor': 'middle',
							                     field: 'data1',
							                     renderer: Ext.util.Format.numberRenderer('0'),
							                     orientation: 'vertical',
							                     color: '#333'
							                 },
							                 xField: 'name',
							                 yField: 'data1'
							             }]
							         });
							
							       var win= Ext.create('Ext.Window', {
							         x:328,
							         y:205,
							         height : 500,
									 width : 700,
							         minHeight: 400,
							         minWidth: 550,
							         hidden: false,
							         maximizable: true,
							         title: 'Grafico Promedio de Vehiculos Ensamblados',
							         renderTo: Ext.getBody(),
							         layout: 'fit',
							          tbar: [{
							             text: 'Guardar Grafico',
							             handler: function() {
							                 Ext.MessageBox.confirm('Confirmar Descarga', '¿Desea descargar esta grafica?', function(choice){
							                     if(choice == 'yes'){
							                         chart.save({
							                             type: 'image/png'
							                         });
							                     }
							                });
							             }
							        }, {
							            	text: 'Actializar Datos',
							            	handler: function() {
							                store1.loadData(generateData());
							         	},
							         	
							        }],
							        items: chart    
							     });
								 }
				if(node.get('text')=='Numero de Vehiculos Vendidos por Marca Ford'){
								 	ventana.close();
								 	var chart = Ext.create('Ext.chart.Chart', {
						            xtype: 'chart',
						            animate: true,
						            style: 'background:#fff',
						            shadow: false,
						            store: store1,
						            axes: [{
						                type: 'Numeric',
						                position: 'bottom',
						                fields: ['data1'],
						                label: {
						                   renderer: Ext.util.Format.numberRenderer('0,0')
						                },
						                title: 'Numeros de Vehiculos Vendidos',
						                minimum: 0
						            }, {
						                type: 'Category',
						                position: 'left',
						                fields: ['name'],
						                title: 'Meses del Año'
						            }],
						            series: [{
						                type: 'bar',
						                axis: 'bottom',
						                label: {
						                    display: 'insideEnd',
						                    field: 'data1',
						                    renderer: Ext.util.Format.numberRenderer('0'),
						                    orientation: 'horizontal',
						                    color: '#333',
						                    'text-anchor': 'middle',
						                    contrast: true
						                },
						                xField: 'name',
						                yField: ['data1'],
						                //color renderer
						                renderer: function(sprite, record, attr, index, store) {
						                    var fieldValue = Math.random() * 20 + 10;
						                    var value = (record.get('data1') >> 0) % 5;
						                    var color = ['rgb(213, 70, 121)', 
						                                 'rgb(44, 153, 201)', 
						                                 'rgb(146, 6, 157)', 
						                                 'rgb(49, 149, 0)', 
						                                 'rgb(249, 153, 0)'][value];
						                    return Ext.apply(attr, {
						                        fill: color
						                    });
						                }
						            }]
						        });


						   			var win = Ext.create('Ext.Window', {
						        	 x:328,
							         y:205,
							         height : 500,
									 width : 700,
							        minHeight: 400,
							        minWidth: 550,
							        hidden: false,
							        maximizable: true,
							        title: 'Grafico Numero de Vehiculos Vendidos por Marca Ford',
							        renderTo: Ext.getBody(),
							        layout: 'fit',
							        tbar: [{
							            text: 'Guardar Grafico',
							            handler: function() {
							                Ext.MessageBox.confirm('Confirmar Descarga', '¿Desea descargar esta grafica?', function(choice){
							                    if(choice == 'yes'){
							                        chart.save({
							                            type: 'image/png'
							                        });
							                    }
							                });
							            }
							        }, {
							            text: 'Actualizar Datos',
							            handler: function() {
							                store1.loadData(generateData());
							            }
							        }],
							        items: chart
							    });
								}
				if(node.get('text')=='Ingreso en Bolivares de Vehiculos Vendidos por Marca'){
									ventana.close();
									store1.loadData(generateData(8));
								    var chart = Ext.create('Ext.chart.Chart', {
								            id: 'chartCmp',
								            xtype: 'chart',
								            style: 'background:#fff',
								            animate: true,
								            theme: 'Category1',
								            store: store1,
								            axes: [{
								                type: 'Numeric',
								                position: 'left',
								                fields: ['data1', 'data2', 'data3'],
								                title: 'Ingresos en Bs. por Ventas',
								                grid: true
								            }, {
								                type: 'Category',
								                position: 'bottom',
								                fields: ['name'],
								                title: 'Meses del Año'
								            }],
								            series: [{
								                type: 'column',
								                axis: 'left',
								                xField: 'name',
								                yField: 'data1',
								                markerConfig: {
								                    type: 'cross',
								                    size: 3
								                }
								            }, {
								                type: 'scatter',
								                axis: 'left',
								                xField: 'name',
								                yField: 'data2',
								                markerConfig: {
								                    type: 'circle',
								                    size: 5
								                }
								            }, {
								                type: 'line',
								                axis: 'left',
								                smooth: true,
								                fill: true,
								                fillOpacity: 0.5,
								                xField: 'name',
								                yField: 'data3'
								            }]
								        });
								 
								
								    var win = Ext.create('Ext.Window', {
								        x:328,
							            y:205,
							            height : 500,
									    width : 700,
								        minHeight: 400,
								        minWidth: 550,
								        hidden: false,
								        maximizable: true,
								        title: 'Grafico de Ingreso en bolivares de Vehiculos Vendidos por Marca',
								        renderTo: Ext.getBody(),
								        layout: 'fit',
								        tbar: [{
								            text: 'Guardar Grafico',
								            handler: function() {
								                Ext.MessageBox.confirm('Confirmar Descarga', 'Desea descargar esta Grafica?', function(choice){
								                    if(choice == 'yes'){
								                        chart.save({
								                            type: 'image/png'
								                        });
								                    }
								                });
								            }
								        }, {
								            text: 'Actualizar Datos',
								            handler: function() {
								                store1.loadData(generateData(8));
								            }
								        }, {
								            enableToggle: true,
								            pressed: true,
								            text: 'Animate',
								            toggleHandler: function(btn, pressed) {
								                var chart = Ext.getCmp('chartCmp');
								                chart.animate = pressed ? { easing: 'ease', duration: 500 } : false;
								            }
								        }],
								        items: chart
								    });
								}
			}
		}
	});

	// ventana = Ext.create('listaespera');
	//ventana.show();

}); 