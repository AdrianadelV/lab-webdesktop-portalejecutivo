//se define la clase banco con sus atributos para ser usada en el combo de banco
Ext.define('Bancos', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'bancos',
		type : 'varchar'
	}, {
		name : 'banco',
		type : 'varchar'
	},{
		name : 'rif',
		type : 'varchar'
	}
	],
	proxy : {
		type : 'ajax',
		url : 'cliente_resful/call_service',
		 reader: {
       		type  : 'json',
       		root  : 'bancos'
   },
	}
});
//store donde se guardan los datos traidos de los servicios para mostrarlos en el combo
var bancosStore = Ext.create('Ext.data.Store', {
	model : 'Bancos',
	autoLoad : true,
});
//se define la clase Concesionarios
Ext.define('Concesionario', {
	extend : 'Ext.data.Model',
	fields : [{
		name : 'id',
		type : 'int'
	}, {
		name : 'nombre',
		type : 'varchar'
	}],
	proxy : {
		type : 'ajax',
		url : 'concesionario/generardatacombosconcesionarios',
	}
});
var concesionariosStore = Ext.create('Ext.data.Store', {
	model : 'Concesionario',
	autoLoad : true,
});
Ext.define('proforma_banco', {
    extend: 'Ext.window.Window',
    x:350,
    y:250,
    height: 723,
    width: 877,
    layout: {
        type: 'absolute'
    },
    title: 'Proforma',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'label',
                    x: 300,
                    y: 30,
                    height: 20,
                    width: 250,
                    text: 'Solicitud de Crédito Personal Natural'
                },
                {
                	store: concesionariosStore,
                    xtype: 'combobox',
                    x: 40,
                    y: 70,
                    width: 310,
                    fieldLabel: 'Concesionario',
                    id : 'cmb_concesionario',
				    valueField : 'id',
				    emptyText : 'Seleccionar',
				    displayField : 'nombre',
				    triggerAction : 'all',
                    minLength: 1,
                    editable : 'false',
				    queryMode : 'remote',
				    selecOnFocus : true,
                    listeners:{
                    	change:function(){
                    		//alert('se modifico');
                    	}
                    },
                    emptyText: 'Nombre del Concesionario',
                    vtype: 'alpha',
                    vtypeText: 'solo texto'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 100,
                    height: 20,
                    text: 'DATOS DEL SOLICITANTE'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 170,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Nombre',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Nombre(S)',
                    id:'nombre'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 170,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Apellido',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Apellido(S)',
                    id:'apellido'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 220,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Telefono',
                    vtype: 'alphanum',
                    vtypeText: 'solo numeros',
                    fieldLabel: 'Telefono',
                    id:'telefono'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 220,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Direccion',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Direccion',
                    id:'direccion'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 270,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Email',
                    fieldLabel: 'Correo Electronico',
                    vtype: 'email',
                    vtypeText: 'email',
                    id:'correo'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 320,
                    text: 'DATOS DE LA OPERACION'
                },
                {
                    xtype: 'datefield',
                    x: 370,
                    y: 70,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Fecha',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Fecha',
                    id:'fecha2'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 360,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Marca',
                    vtype: 'alpha',
                    id:'marca_vehiculo',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Marca'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 360,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Modelo',
                    id:'modelo_vehiculo',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Modelo'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 410,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Año del Vehiculo',
                    vtype: 'alpha',
                    vtypeText: 'solo numero',
                    fieldLabel: 'Año',
                    id: 'ano_vehiculo'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 410,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Color',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Color',
                    id: 'color_vehiculo'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 460,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Costo',
                    vtype: 'alphanum',
                    vtypeText: 'solo Numero',
                    fieldLabel: 'Costo',
                    id: 'costo_vehiculo'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 460,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Transmision Vehiculo',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Transmision Vehiculo',
                    id:'transmision_vehiculo'
                },
                {
                    xtype: 'button',
                    x: 340,
                    y: 630,
                    height: 30,
                    width: 80,
                    text: 'Enviar ',
                    tooltip: 'Enviar Proforma al Banco'
                },
                {
                    xtype: 'button',
                    x: 450,
                    y: 630,
                    height: 30,
                    width: 80,
                    text: 'Cancelar',
                    listeners:{
                    	click:function(){	
                            grabar_detalle();
                           grabar_proforma();
                    		ventana.close();
                    		enviar_correo();
                    	//alert('FUNCIONA');
                    	}
                    },
                    tooltip: 'Cancelar envio'
                },
                {
                    xtype: 'button',
                    x: 560,
                    y: 630,
                    height: 30,
                    width: 80,
                    text: 'Imprimir',
                    listeners:{
                    	click:function(){
                    		imprimir();
                    	}
                    },
                    tooltip: 'Imprimir Proforma'
                },
                {
                    xtype: 'datefield',
                    x: 370,
                    y: 270,
                    width: 370,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Validez',
                    vtype: 'alphanum',
                    value : new Date(),
                    vtypeText: 'solo texto',
                    fieldLabel: 'Validez',
                    id:'validez',
                    disabled: true
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 120,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Cedula',
                    vtype: 'alpha',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Cedula',
                    id:'cedula'
                },
                {
                    xtype: 'textfield',
                    x: 370,
                    y: 120,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'Sexo',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Sexo',
                    id:'sexo'
                },
                {
                    xtype: 'combobox',
                    store : bancosStore,
                    x: 40,
                    y: 560,
                    width: 310,
                    id : 'cmb_banco',
				    valueField : 'banco',
				    emptyText : 'Seleccionar',
				    displayField : 'banco',
				    triggerAction : 'all',
				    editable : 'false',
				    queryMode : 'remote',
				    selecOnFocus : true,
                    fieldLabel: 'Banco'
                },
                {
                    xtype: 'textfield',
                    x: 40,
                    y: 505,
                    width: 310,
                    allowBlank:  false,
                    blankText: 'Este campo es requerido',
                    minLength: 1,
                    emptyText: 'tapiceria',
                    vtype: 'alphanum',
                    vtypeText: 'solo texto',
                    fieldLabel: 'Tapiceria',
                    id:'tapiceria'
                },
                {
                    xtype: 'label',
                    x: 10,
                    y: 540,
                    text: 'Datos del BANCO'
                }
            ]
        });

        me.callParent(arguments);
    }
 });
function imprimir(){
	   Ext.Ajax.request({
		   url : 'cli_comprador/imprimir_proforma',
			method: 'POST',
			params:{
				 nombres: Ext.getCmp('nombre').getValue(),
				 banco: Ext.getCmp('cmb_banco').getValue(),
				 cedula: Ext.getCmp('cedula').getValue()
			},
			success: function ( result, request ) { 
		                alert("se esta imprimiedo")
			},
			failure: function ( result, request) { 
				Ext.MessageBox.alert('Error', result.responseText); 
			} 
	   });
}
function enviar_correo(){
	Ext.Ajax.request({
		   url : 'enviar_correo/enviarcorreo',
			method: 'POST',
			params:{
				 	nombre: Ext.getCmp('nombre').getValue(),
				 	apellido: Ext.getCmp('apellido').getValue(),
				 	telefono: Ext.getCmp('telefono').getValue(),
				 	correo: Ext.getCmp('correo').getValue(),
				 	fecha_generada: Ext.getCmp('fecha2').getValue(),
				 	marca: Ext.getCmp('marca_vehiculo').getValue(),
				 	modelo: Ext.getCmp('modelo_vehiculo').getValue(),
				 	color: Ext.getCmp('color_vehiculo').getValue(),
				 	costo_vehiculo: Ext.getCmp('costo_vehiculo').getValue(),
				 	transmision: Ext.getCmp('transmision_vehiculo').getValue(),
				 	tapiceria: Ext.getCmp('tapiceria').getValue(),
				 	banco: Ext.getCmp('cmb_banco').getRawValue(),
				 	concesionario: Ext.getCmp('cmb_concesionario').getRawValue()
			},
			success: function ( result, request ) { 
				         alert("Se envio un COrreo");
			},
			failure: function ( result, request) { 
				Ext.MessageBox.alert('Error', result.responseText); 
			} 
	   });
	
}
function grabar_detalle(){
	   Ext.Ajax.request({
		   url : 'cli_comprador/guardar_detalle_vehiculo_proforma',
			method: 'POST',
			params:{
				 color: id_color(),         	
				 transmision:id_transmision() ,
				 tapiceria: id_tapiceria(),
				 modelo:id_modelo()
			},
			success: function ( result, request ) { 
		                alert("se grabo el detalle")
			},
			failure: function ( result, request) { 
				Ext.MessageBox.alert('Error', result.responseText); 
			} 
	   });
}
function grabar_proforma(){
	   Ext.Ajax.request({
		   url : 'cli_comprador/guardar_proforma',
			method: 'POST',
			params:{
				fecha: Ext.getCmp('fecha2').getValue(),
				validez: Ext.getCmp('validez').getValue(),
				estatus:'En espera',
				banco:2,
				cedula:Ext.getCmp('cedula').getValue()
			},
			success: function ( result, request ) { 
		                alert("Se grabo la Proforma")
			},
			failure: function ( result, request) { 
				Ext.MessageBox.alert('Error', result.responseText); 
			} 
	   });
}

