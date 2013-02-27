/*********************************************************/
/*                 ExtStart08.js                         */
/*********************************************************/
/*
  Autor  : Edgar Gonzalez
  Version: 1.0 en javascript 1.2
  Fecha  : 14 de noviembre del 2012
*/

// Basado en div
/*Ext.onReady(function(){
	Ext.get('Aceptar').on('click', function(){
		var mensaje = Ext.get('divMensaje');
		mensaje.load({
			url: 'ajaxejemplo08', 
			params: 'nombre=' + Ext.get('nombre').dom.value,
			text: 'Actualizando...'
		});
		mensaje.show();
	});
});*/

// usando el objeto Ajax
Ext.onReady(function(){
    Ext.get('Aceptar').on('click', function(){
      var nombre = Ext.get('nombre').dom.value;
      Ext.Ajax.request({
	url : 'ajaxejemplo08' , 
	params : { nombre : nombre },
	method: 'POST',
	success: function ( result, request ) { 
		Ext.MessageBox.alert('Mensaje', result.responseText);
	},
	failure: function ( result, request) { 
		Ext.MessageBox.alert('Error', result.responseText); 
	} 
      });
    });
});



