/*********************************************************/
/*                 ExtStart13.js                         */
/*********************************************************/
/*
  Autor    : Edgar Gonzalez
  Version  : 1.0 en javascript 1.2
  Fecha    : 14 de noviembre del 2012
  basado en: http://extjstutorial.info/extjs-4-tutorial-extjs-tree-with-php-dan-mysql/86
             http://www.sencha.com/forum/showthread.php?4595-Creating-Ext.tree.TreePanel-from-static-JSON-data-in-one-shot
*/

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
	         			url: 'ejemplo13/generarmenu?tipo=2'
	         		},
	         		root: {
	         			text: 'Menu',
	         			id: 'root_node',
	         			expanded: true
	         		},
	         		folderSort: false,
	         		sorters: [{
	         			property: 'id',
	         			direction: 'ASC'
	         		}]
	         	});

	         	var tree = Ext.create('Ext.tree.Panel', {
	         		store: store,
	         		renderTo: 'tree_el',
	         		height: 300,
	         		width: 250,
	         		title: 'STC-Cargo',
	         		useArrows: true,
	                         listeners: {
	                         itemclick: function(view, node) {
	                         if(node.isLeaf()) {
	                          Ext.Msg.alert('Datos del Nodo',
	                             'Nodo id: ' + node.get('id') + '<br/>' +
	                             'Nodo Texto: ' + node.get('text') + '<br/>' +
	                             'Padre Nodo id: ' + node.get('parentId') + '<br/>' +
	                             'Es una hoja?: ' + node.get('leaf') + '<br/>' +
	                             'Nro de Hijos: ' + node.childNodes.length
	                         );
	                         } else if(node.isExpanded()) {
	                            node.collapse();
	                           } else {
	                              node.expand();
	                             }
	                        }
	         	       	
	                  }
	         	});
	         });