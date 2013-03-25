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
var usuariologeado = "";
var datos2 = "";

Ext.define('actualizar', {
	extend : 'Ext.window.Window',

	height : 390,
	id : 'actualizardatos',
	width : 500,
	x : 370,
	y : 210,
	layout : {
		type : 'absolute'
	},
	title : 'Actualizar',

	initComponent : function() {
		var me = this;
		Ext.applyIf(me, {
			items : [{
				xtype : 'tabpanel',
				x : -4,
				y : -2,
				height : 390,
				activeTab : 0,
				items : [{
					xtype : 'panel',
					height : 360,
					layout : {
						type : 'absolute'
					},
					title : 'Informacion Personal',
					items : [{
						xtype : 'container'
					}, 
					{
						xtype : 'textfield',
						x : 30,
						y : 20,
						fieldLabel : 'Cedula',
						id : 'cedula',
						disabled: true
					},{
						xtype : 'textfield',
						x : 30,
						y : 50,
						fieldLabel : 'Nombre(s)',
						id : 'nombre'

					}, {
						xtype : 'textfield',
						x : 30,
						y : 80,
						fieldLabel : 'Apellido(s)',
						id : 'apellido'
					}, {
						xtype : 'textfield',
						x : 30,
						y : 110,
						fieldLabel : 'Direccion',
						id : 'direccion'
					}, {
						xtype : 'textfield',
						x : 30,
						y : 140,
						fieldLabel : 'Telefono',
						id : 'telefono'
					}, {
						xtype : 'textfield',
						x : 30,
						y : 170,
						fieldLabel : 'Correo',
						id : 'correo'
					},{
                    	xtype: 'datefield',
                    	x : 30,
						y : 200,
                    	width: 370,
                    	allowBlank:  false,
                    	blankText: 'Este campo es requerido',
                    	minLength: 1,
                    	emptyText: 'Fecha',
                    	vtype: 'alphanum',
                    	vtypeText: 'solo texto',
                    	fieldLabel: 'Fecha Nacimiento',
                    	id : 'fecha'
                	}, {
						xtype : 'textfield',
						x : 30,
						y : 240,
						fieldLabel : 'Sexo',
						id : 'sexo'
					}, {
						xtype : 'button',
						x : 190,
						y : 275,
						text : 'Grabar',
						listeners : {
							click :function(){
								grabar_comprador();
							}
						},
						id : 'grabar'
					}, {
						xtype : 'button',
						x : 264,
						y : 275,
						text : 'Cancelar',
						id : 'cancelar'
					}]
				}, {
					xtype : 'panel',
					height : 390,
					layout : {
						type : 'absolute'
					},
					title : 'Cuenta de Usuario',
					items : [{
						xtype : 'textfield',
						x : 60,
						y : 30,
						fieldLabel : 'Contraseña anterior',
						id : 'contrasena'
					}, {
						xtype : 'textfield',
						x : 60,
						y : 70,
						fieldLabel : 'Contraseña nueva',
						id : 'contrasenanueva'
					}, {
						xtype : 'textfield',
						x : 60,
						y : 110,
						fieldLabel : 'Repetir Contraseña',
						id : 'repetircontrasena'
					}, {
						xtype : 'button',
						x : 220,
						y : 180,
						text : 'Guardar',
						listeners : {
							click : function() {
								cambiarContrasena();
							}
						}
					}, {
						xtype : 'button',
						x : 295,
						y : 180,
						text : 'Cancelar'
					}]
				}]
			}]
		});
		me.callParent(arguments);
	}
});
function buscar_comprador() {
	Ext.Ajax.request({
		url : '/cli_comprador/buscarComprador',
		//Retorno exitoso de la pagina servidora a traves del formato JSON
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				Ext.getCmp('cedula').setValue(datos.cedula);
				Ext.getCmp('nombre').setValue(datos.nombres);
				Ext.getCmp('apellido').setValue(datos.apellidos);
				Ext.getCmp('direccion').setValue(datos.direccion);
				Ext.getCmp('telefono').setValue(datos.telefono);
				Ext.getCmp('correo').setValue(datos.correo);
				Ext.getCmp('sexo').setValue(datos.sexo);
				Ext.getCmp('fecha').setValue(datos.fecha_nacimiento);
				
			}
		},
		//No hay retorno de la pagina servidora
		failure : function() {
			Ext.Msg.alert("Error", "Servidor no conectado");

		}
	});
}
function grabar_comprador() {
	Ext.Ajax.request({
             url: '/cli_comprador/grabarComprador',    
             //Enviando los parametros a la pagina servidora
           params: {
              ajax: 'true',
              funcion: 'grabarComprador',
              cedula: Ext.getCmp('cedula').getValue(), //obtiene el valor a traves del id del campo
              nombres: Ext.getCmp('nombre').getValue(),
              apellidos: Ext.getCmp('apellido').getValue(),
              telefono: Ext.getCmp('telefono').getValue(),
              direccion: Ext.getCmp('direccion').getValue(),
              correo: Ext.getCmp('correo').getValue(),
              fecha_nacimiento: Ext.getCmp('fecha').getValue(),
              sexo: Ext.getCmp('sexo').getValue(),
           },
             //Retorno exitoso de la pagina servidora a traves del formato JSON
           success: function( resultado, request ) {
              datos=Ext.JSON.decode(resultado.responseText);
              Ext.Msg.alert("Exito", "Se ha Guardado la Modificación!!");
           },
             //No hay retorno de la pagina servidora
           failure: function() {
              Ext.Msg.alert("Error", "Servidor no conectado!AQUI");
           }
      });        
}

function cambiarContrasena() {
	if (Ext.getCmp('contrasenanueva').getValue()== Ext.getCmp('repetircontrasena').getValue()) {
		Ext.Ajax.request({
			method: 'POST',
		    headers: {
                    "Accept" : 'application/json'
                },
		   url: '/cli_comprador/modificarContrasena',    
		     //Enviando los parametros a la pagina servidora
		   params: {
		      nombre: document.getElementById("user_name").textContent,
		      canterior: Ext.getCmp('contrasena').getValue(),
		      cnueva: Ext.getCmp('contrasenanueva').getValue(),
		   },
		     //Retorno exitoso de la pagina servidora a traves del formato JSON
		   success: function( resultado, request ) {
		      datos=Ext.JSON.decode(resultado.responseText);
		      //alert(datos.nombre);
		      Ext.Msg.alert("Exito", datos.message);
		   },
		     //No hay retorno de la pagina servidora
		   failure: function() {
		      Ext.Msg.alert("Error", "Servidor no conectado!AQUI");
		   }
		});
	} else{
		  Ext.Msg.alert("Error", "Las contraseñas nuevas deben ser iguales");
	};
  
}
