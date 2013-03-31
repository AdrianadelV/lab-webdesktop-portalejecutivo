var marcaStore = null;
var data = null;
var typeExtension = "image";
Ext.require([
    'Ext.form.field.File',
    'Ext.form.Panel',
    'Ext.window.MessageBox'
]);

function checkFileExtension(elem) {
	var filePath = elem;
    if (filePath.indexOf('.') == -1)
		return false;

	var validExtensions = new Array();
	var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();

	if (typeExtension == "image") {
		validExtensions[0] = 'jpg';
		validExtensions[1] = 'jpeg';
		validExtensions[3] = 'png';
		validExtensions[4] = 'gif';
	} else {
		validExtensions[0] = 'pdf';
	}

	for (var i = 0; i < validExtensions.length; i++) {
		if (ext == validExtensions[i])
			return true;
	}

	Ext.Msg.alert('Advertencia', 'La extension .' + ext + ' del archivo ' + filePath + ' no es permitida!');
	if (typeExtension == "image") {
		document.getElementsByName('ufile[]')[0].value = '';
		// xt.getCmp('imagen0').setSrc('images/transporte.jpg');
	}
	// else {
	// document.getElementsByName('ufile1[]')[0].value='';
	// xt.getCmp('planilla0').setSrc('helloworld.pdf');
	// }
	return false;
}

function previewImage(input) {
	typeExtension = "image";
	if (!checkFileExtension(encodeURIComponent(document.getElementsByName("ufile[]")[0].value))) {
		return false;
	}
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('imagen0').src = e.target.result
		}
		reader.readAsDataURL(input.files[0]);
	}
}

Ext.define('VentanaMarca', {
	extend : 'Ext.window.Window',

	height : 450,
	id : 'ventanamarca',
	width : 600,
	x : 400,
	y : 260,
	layout : {
		type : 'absolute'
	},
	title : 'Registrar Marca',

	initComponent : function() {
		var me = this;

		Ext.applyIf(me, {
			items : [{
				xtype : 'form',
				x : 0,
				y : 0,
				autoRender : false,
				height : 520,
				id : 'formulariomarca',
				layout : {
					type : 'absolute'
				},
				bodyPadding : 10,
				title : '',
				items : [{
					xtype : 'textfield',
					x : 60,
					y : 50,
					formBind : false,
					width : 320,
					tabIndex : 1,
					fieldLabel : 'Nombre',
					msgTarget : 'under',
					blankText : 'Este campo es requerido',
					enableKeyEvents : true,
					minLength : 1,
					emptyText : 'Nombre de la Marca',
					vtype : 'alphanum',
					listeners : {
						specialkey : function(field, e) {
							if (e.getKey() == e.ENTER) {
								buscar_marca();
							}
						}
					},
					id : 'nombre'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 130,
					width : 360,
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Mision de la Marca',
					id : 'mision',
					fieldLabel : 'Mision'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 170,
					width : 360,
					id : 'vision',
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Vision de la Marca',
					fieldLabel : 'Vision'
				}, {
					// xtype : 'image',
					// id : 'imagen0',
					// y : 75,
					// x : 160,
					// border : '',
					// frame : true,
					// height : 110,
					// width : 130,
					// src : ''
				}, {		
		            xtype: 'filefield',
		            x : 60,
					y : 90,
		            id: 'imagen',
		            emptyText: 'Imagen',
		            fieldLabel: 'Imagen',
		            name: 'photo-path',
		            buttonText: 'Seleccionar Archivo',
		            buttonConfig: {
		                iconCls: 'upload-icon'
			        }
			    
					// id : 'imagen1',
					// border : '',
					// x : 160,
					// y : 180,
					// html : '<input type="file" class="x-form-file-input" size="10" name="ufile[]" onchange="previewImage(this) />',
				}, {
					xtype : 'textfield',
					x : 60,
					y : 200,
					width : 360,
					id : 'valores',
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Valores de la Marca',
					fieldLabel : 'Valores'
				}, {
					xtype : 'textfield',
					x : 60,
					y : 230,
					width : 360,
					id : 'contacto',
					allowBlank : false,
					blankText : 'Este campo es requerido',
					minLength : 1,
					emptyText : 'Contactos de la Marca',
					fieldLabel : 'Contacto'
				}, {
					xtype : 'button',
					x : 390,
					y : 50,
					text : '.....',
					id : 'btncatalogo',
					listeners : {
						click : function() {
							//alert('pase');
							//this.findById("formulario")
						}
					}
				}, {
					xtype : 'button',
					x : 155,
					y : 270,
					text : 'Eliminar',
					icon : 'images/eliminar.png',
					tooltip : 'Eliminar Marca',
					id : 'btneliminar'
				}, {
					xtype : 'button',
					x : 250,
					y : 270,
					text : 'Limpiar',
					icon : 'images/limpiar.png',
					id : 'btncancelar',
					listeners : {
						click : function() {
							Ext.getCmp('formulariomarca').getForm().reset();
						}
					}
				}, {
					xtype : 'button',
					x : 340,
					y : 270,
					text : 'Guardar',
					icon : 'images/grabar.png',
					tooltip : 'Registrar una Marca',
					id : 'btnregistrar',
					listeners : {
						click : function() {
							if (Ext.getCmp('nombre').getValue() == "" || Ext.getCmp('mision').getValue() == "" || 
							    Ext.getCmp('vision').getValue() == "" || Ext.getCmp('valores').getValue() == "" ||
                                Ext.getCmp('contacto').getValue() == "") {
								Ext.Msg.alert("Error", "Debes LLenar todos los campos");
							} else {
								grabar_marca();
							}
						}
					}
				}]
			}]
		});

		//metodo para hacer grabar los datos
		function grabar_marca() {
			Ext.Ajax.request({
				url : 'menu_admin/grabar_marca',
				params : {
					ajax : 'true',
					funcion : 'grabar_marca',
					nombre : Ext.getCmp('nombre').getValue(),
					mision : Ext.getCmp('mision').getValue(),
					vision : Ext.getCmp('vision').getValue(),
					valores : Ext.getCmp('valores').getValue(),
					contacto : Ext.getCmp('contacto').getValue(),
					imagen : Ext.getCmp('imagen').getValue(),
				},
				success : function(exito, request) {
					//alert('PasoImagen');
					// datos = Ext.JSON.decode(exito, reponseText);
					// datos = Ext.JSON.decode(exito, reponseText);
					Ext.Msg.alert("Exito", "Se ha Guardado la Marca!!");
					Ext.getCmp('formulariomarca').getForm().reset();
					// Ext.getCmp('btnregistrar').disable(false);
				},
				failure : function() {
					Ext.Msg.alert("Error", "Servidor NO Conectado!!");
				}
			});
		}

		//metodo seleccionar marca
		function eliminar_marca() {
			Ext.Ajax.request({
				url : 'menu_admin/eli_marca',
				params : {
					ajax : 'true',
					funcion : 'eli_marca',
					nombre : Ext.getCmp('nombre').getValue()
				},
				//Retorno exitoso de la pagina servidora a traves del formato JSON
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito.responseText);
					if (datos.exito == 'true') {
						Ext.Msg.alert("Mensaje", datos.msg);
					} else {
						Ext.Msg.alert("Mensaje", datos.msg);
					}
				},
				//No hay retorno de la pagina servidora
				failure : function() {
					//alert(Ext.getCmp('nombre').getValue());
					Ext.Msg.alert("Mensaje", "Servidor no conectado");

				}
			});
		}

		function buscar_marca() {
			Ext.Ajax.request({
				url : 'menu_admin/buscar_marca',
				params : {
					ajax : 'true',
					funcion : 'buscar_marca',
					nombre : Ext.getCmp('nombre').getValue(),
				},
				//Retorno exitoso de la pagina servidora a traves del formato JSON
				success : function(exito, request) {
					datos = Ext.JSON.decode(exito.responseText);
					if (datos.exito == 'true') {
						Ext.getCmp('nombre').setValue(datos.nombre);
						Ext.getCmp('imagen').setValue(datos.imagen);
						Ext.getCmp('mision').setValue(datos.mision);
						Ext.getCmp('vision').setValue(datos.vision);
						Ext.getCmp('valores').setValue(datos.valores);
						Ext.getCmp('contacto').setValue(datos.contacto);
					//	Ext.getCmp('btnregistrar').disable(true);
						Ext.getCmp('imagen0').setSrc(Ext.getCmp('imagen').getValue());
					} else {
						Ext.Msg.alert("Error", datos.msg);
						Ext.getCmp('btnregistrar').enable(true);
						Ext.getCmp('btneliminar').disable(true);
					}
				},
				//No hay retorno de la pagina servidora
				failure : function() {
					alert(Ext.getCmp('nombre').getValue());
					Ext.Msg.alert("Error", "Servidor no conectado");

				}
			});
			//Ext.getCmp('btnregistrar').disable(false);
			//Ext.getCmp('nombre').focus();

		}

		me.callParent(arguments);
	}
});
