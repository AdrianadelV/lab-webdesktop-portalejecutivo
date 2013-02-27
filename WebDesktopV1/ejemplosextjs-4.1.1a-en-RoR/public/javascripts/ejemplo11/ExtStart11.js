/*********************************************************/
/*                 ExtStart11.js                         */
/*********************************************************/
/*
  Autor  : Edgar Gonzalez
  Version: 1.0 en javascript 1.2
  Fecha  : 14 de noviembre del 2012
*/
Ext.onReady(function() {

	Ext.create('Ext.panel.Panel', {
	    title: 'Seleccione una fecha',
	    width: 400,
	    bodyPadding: 10,
	    renderTo: Ext.getBody(),
	    items: [{
	                name : 'fecha',
	                xtype: 'datefield',
	                fieldLabel: 'Fecha',
	                id: 'fechaentrega',
	                format : 'd/m/Y',
	                value: '12/03/2012',        
	                submitFormat:'Y-m-d' 
	    }]
	});
    alert('Espere...');
	Ext.getCmp('fechaentrega').setValue(new Date());
	Ext.MessageBox.show({
        title: 'Mensaje',
        msg: 'La fecha de entrega es: ' + Ext.getCmp('fechaentrega').getSubmitValue(),
        width:400,
        buttons: Ext.MessageBox.OK
       });

});


