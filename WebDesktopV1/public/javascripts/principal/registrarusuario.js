//alert("se llamo");

Ext.require(['Ext.tree.*', 'Ext.data.*', 'Ext.tip.*', 'Ext.container.Viewport', 'Ext.container.ButtonGroup']);


var modelo = new Ext.data.SimpleStore({
	fields : ['id', 'modelo'],
	data : [['1', 'Femenino'], ['2', 'Masculino']]
});

function verificaredad() {

	var currentDate = new Date();
	// fn = new Date();
	var fn = Ext.getCmp('fecha_nacimiento').getValue();

	
	
	var day = currentDate.getDate();
	var fd = fn.getDate();
	
	var month = currentDate.getMonth() + 1;
	var fm = fn.getMonth() + 1;

	var year = currentDate.getFullYear();
	var fa = fn.getFullYear();

	var pa = false;

	if ((year - fa) < 18) {
		
		pa = false
	} else {
		if ((year - fa) == 18) {
			
			if (fm > month) {
				pa = false
			} else {
				if (fm == month) {
					
					if (fd <= day) {
						
						pa = true
					} else {
						
						pa = false
					}

				} else {
					
					pa = true
				}
			}
		} else {
			pa = true
		}
	}

	return pa

}

Ext.onReady(function() {
	Ext.QuickTips.init();
	Ext.define('VentaRegistrarUsuario', {
		extend : 'Ext.window.Window',

		height : 549,
		id : 'ventanacomprador',
		width : 661,
		x : 380,
		y : 225,
		layout : {
			type : 'absolute'
		},
		title : 'Registrar comprador',

		items : [{
			xtype : 'form',

			autoRender : true,
			height : 420,
			id : 'formulariocomprador',
			layout : {
				type : 'absolute'
			},
			bodyPadding : 10,
			title : '',

			items : [{
				xtype : 'filefield',
				x : 0,
				y : 270,
				id : 'imagen',
				emptyText : 'Imagen',
				fieldLabel : 'Imagen',
				name : 'photo-path',
				buttonText : 'Seleccionar Archivo',
				buttonConfig : {
					iconCls : 'upload-icon'
				}
			}, {
				xtype : 'textfield',
				x : 0,
				y : 70,
				width : 200,
				fieldLabel : 'Cedula',
				id : 'cedula',
				minLength : 1,
				vtype : 'alphanum',
				emptyText : 'Campo obligatorio'
			}, {
				xtype : 'textfield',
				x : 0,
				y : 110,
				width : 290,
				fieldLabel : 'Nombres',
				id : 'nombres',
				minLength : 1,
				vtype : 'alpha',
				emptyText : 'Nombre1_Nombre2'
			}, {
				xtype : 'textfield',
				x : 0,
				y : 150,
				width : 290,
				fieldLabel : 'Apellidos',
				id : 'apellidos',
				minLength : 1,
				vtype : 'alpha',
				emptyText : 'Apellido1_Apellido2'
			}, {
				xtype : 'textfield',
				x : 0,
				y : 190,
				width : 250,
				fieldLabel : 'Telefono',
				id : 'telefono',
				minLength : 1,
				emptyText : 'Campo obligatorio'
			}, {
				xtype : 'textfield',
				x : 260,
				y : 150,
				fieldLabel : 'Correo',
				id : 'correo',
				minLength : 1,
				vtype : 'email',
				emptyText : 'Campo obligatorio'
			}, {
				xtype : 'textfield',
				x : 260,
				y : 190,
				fieldLabel : 'Repetir Correo',
				id : 'correo2',
				minLength : 1,
				vtype : 'email',
				emptyText : 'Campo obligatorio'
			}, {
				xtype : 'textfield',
				x : 0,
				y : 230,
				width : 430,
				fieldLabel : 'Direccion',
				id : 'direccion',
				minLength : 1,
				vtype : 'alphanum',
				emptyText : 'calle_x_carrera_x_casa_x_urb_x'
			}, {
				xtype : 'datefield',
				x : 260,
				y : 70,
				fieldLabel : 'Fecha de nacimiento',
				id : 'fecha_nacimiento',
				minLength : 1,
				emptyText : 'Campo obligatorio'
			}, {
				store : modelo,
				xtype : 'combobox',
				x : 260,
				y : 110,
				width : 200,
				fieldLabel : 'Sexo',
				minLength : 1,
				mode : 'local',

				displayField : 'modelo',
				fieldLabel : 'Sexo',
				id : 'sexo'
			}, {
				xtype : 'textfield',
				x : 0,
				y : 300,
				fieldLabel : 'Nombre de usuario',
				id : 'nusuario',
				minLength : 1,
				vtype : 'alphanum',
				emptyText : 'Campo obligatorio'

			}, {
				xtype : 'textfield',
				x : 0,
				y : 340,
				fieldLabel : 'Contraseña',
				id : 'password',
				minLength : 1,
				vtype : 'alphanum',
				emptyText : 'Campo obligatorio',
				allowBlank : false,
				emptyText : 'Campo obligatorio'

			}, {
				xtype : 'textfield',
				x : 240,
				y : 330,
				fieldLabel : 'Repetir contraseña',
				id : 'password2',
				minLength : 1,
				vtype : 'alphanum',
				emptyText : 'Campo obligatorio'
			}, {
				xtype : 'button',
				x : 440,
				y : 400,
				text : 'Registrar',
				id : 'registrar',
				listeners : {
					click : function() {
						
						if (verificarcampos()) {

							if (verificarpassword()) {

								if (verificarcorreo()) {

									if (verificaredad()) {
										grabar_comprador();
										enviar_correo();
										Ext.getCmp('formulariocomprador').getForm().reset();
										
									} else {
										alert("El usuario es menor de edad, no se va a registrar");
									}
								} else {
									alert("Los correos no son iguales");
								}

							} else {
								alert("Las contraseñas no son iguales");
							};
						} else {
							alert("Debe llenar todos los campos");
						}
						//ventanaregistrarusuario.close();
						
					}
				}
				//aqui va a otro lugar url:'inicio'
			}, {
				xtype : 'button',
				x : 360,
				y : 400,
				text : 'Cancelar',
				listeners : {
					click : function() {

						Ext.getCmp('formulariocomprador').getForm().reset();
					}
				}, url:'inicio'
			}, {
				xtype : 'button',
				x : 280,
				y : 400,
				text : 'Ir a INICIO',
				listeners : {
					click : function() {

						
					}
				}, url:'inicio'
			}]
		}]

		//} ) aplyif me
		//} del in component

	});
	ventanaregistrarusuario = Ext.create('VentaRegistrarUsuario')
	ventanaregistrarusuario.show();

	function buscar_usuario() {
		Ext.Ajax.request({
			url : 'registrarusuario/buscar_usuario',
			params : {
				ajax : 'true',
				funcion : 'buscar_usuario',
				nombre : Ext.getCmp('nusuario').getValue(),
			},

			//Retorno exitoso de la pagina servidora a traves del formato JSON
			success : function(exito, request) {
				datos = Ext.JSON.decode(exito.responseText);
				if (datos.exito == 'true') {

					Ext.Msg.alert("El nombre de usuario ya existe.");

				} else {

					grabar_comprador();
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
			url : 'registrarusuario/grabar_comprador',
			params : {
				ajax : 'true',
				funcion : 'grabar_comprador',
				//obtiene el valor a traves del id del campo
				cedula : Ext.getCmp('cedula').getValue(),
				nombres : Ext.getCmp('nombres').getValue(),
				apellidos : Ext.getCmp('apellidos').getValue(),
				telefono : Ext.getCmp('telefono').getValue(),
				direccion : Ext.getCmp('direccion').getValue(),
				correo : Ext.getCmp('correo').getValue(),
				fecha_nacimiento : Ext.getCmp('fecha_nacimiento').getValue(),
				sexo : Ext.getCmp('sexo').getValue(),
				nusuario : Ext.getCmp('nusuario').getValue(),
				password : Ext.getCmp('password').getValue(),
				imagen : Ext.getCmp('imagen').getValue(),

			},
			success : function(exito, request) {
				datos = Ext.JSON.decode(exito, reponseText);

				Ext.Msg.alert("Exito", "Se registro el usuario!!");
				

			},
			failure : function() {
				//Ext.Msg.alert("Error", "Servidor NO Conectado!!");
			}
			
		})

		

	}

	function verificarpassword() {

		if (Ext.getCmp('password').getValue() == Ext.getCmp('password2').getValue()) {
			return true
		} else {
			return false
		}
	}

	function verificarcorreo() {
		if (Ext.getCmp('correo').getValue() == Ext.getCmp('correo2').getValue()) {
			return true
		} else {
			return false
		}
	}

	function verificarcampos() {
		if (Ext.getCmp('cedula').getValue() == "" || Ext.getCmp('nombres').getValue() == "" || Ext.getCmp('apellidos').getValue() == "" || Ext.getCmp('telefono').getValue() == "" || Ext.getCmp('direccion').getValue() == "" || Ext.getCmp('fecha_nacimiento').getValue() == null || Ext.getCmp('sexo').getValue() == null || Ext.getCmp('nusuario').getValue() == "" || Ext.getCmp('password').getValue() == "" || Ext.getCmp('password2').getValue() == "" || Ext.getCmp('correo').getValue() == "" || Ext.getCmp('correo2').getValue() == "" || Ext.getCmp('imagen').getValue() == "") {
			return false
		} else {
			return true
		}
	}
	function enviar_correo(){
	Ext.Ajax.request({
		   url : 'enviar_correo/enviarcorreo_nuevousuario',
			method: 'POST',
			params:{
				    nombres : Ext.getCmp('nombres').getValue(),
					apellidos : Ext.getCmp('apellidos').getValue(),
				 	correo: Ext.getCmp('correo').getValue(),
				 	nusuario : Ext.getCmp('nusuario').getValue(),
					password : Ext.getCmp('password').getValue(),
			},
			success: function ( result, request ) { 
				         alert("Se envio un COrreo");
			},
			failure: function ( result, request) { 
				Ext.MessageBox.alert('Error', result.responseText); 
			} 
	   });
	
}

})
