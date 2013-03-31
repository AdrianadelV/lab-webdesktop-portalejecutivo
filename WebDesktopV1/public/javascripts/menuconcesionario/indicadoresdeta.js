
Ext.define('indicadoresdeta', {
    extend: 'Ext.window.Window',
	y : 237,
	x : 485,
    height: 346,
    width: 458,
    title: 'Configuracion',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    height: 323,
                    layout: {
                        type: 'absolute'
                    },
                    bodyPadding: 10,
                    items: [
                        {
                            xtype: 'fieldset',
                            x: 10,
                            y: 10,
                            height: 280,
                            layout: {
                                type: 'absolute'
                            },
                            title: 'Detalles del Indicador',
                            items: [
                                {
                                    xtype: 'label',
                                    x: 100,
                                    y: 10,
                                    text: 'Valores establecidos'
                                },
                                {
                                    xtype: 'label',
                                    x: 140,
                                    y: 200,
                                    height: 20,
                                    id: 'ctelefono_resp',
                                    text: ''
                                },
                                {
                                    xtype: 'label',
                                    x: 80,
                                    y: 200,
                                    text: 'Teléfono:'
                                },
                                {
                                    xtype: 'label',
                                    x: 140,
                                    y: 170,
                                    id: 'ccorreo_resp',
                                    text: ''
                                },
                                {
                                    xtype: 'label',
                                    x: 90,
                                    y: 170,
                                    height: 20,
                                    text: 'Correo:'
                                },
                                {
                                    xtype: 'label',
                                    x: 140,
                                    y: 140,
                                    height: 20,
                                    width: 130,
                                    id: 'cnombre_resp',
                                    text: ''
                                },
                                {
                                    xtype: 'label',
                                    x: 50,
                                    y: 140,
                                    height: 20,
                                    width: 90,
                                    text: 'Responsable:'
                                },
                                {
                                    xtype: 'label',
                                    x: 270,
                                    y: 10,
                                    text: 'Fechas validas'
                                },
                                {
                                    xtype: 'label',
                                    x: 30,
                                    y: 40,
                                    height: 20,
                                    width: 40,
                                    text: 'Meta'
                                },
                                {
                                    xtype: 'label',
                                    x: 10,
                                    y: 70,
                                    text: 'Amarillo'
                                },
                                {
                                    xtype: 'label',
                                    x: 30,
                                    y: 100,
                                    text: 'Rojo'
                                },
                                {
                                    xtype: 'label',
                                    x: 120,
                                    y: 40,
                                    id: 'cvalor_meta',
                                    text: ''
                                },
                                {
                                    xtype: 'label',
                                    x: 120,
                                    y: 70,
                                    id: 'cvalor_amarillo',
                                    text: ''
                                },
                                {
                                    xtype: 'label',
                                    x: 120,
                                    y: 100,
                                    id: 'cvalor_rojo',
                                    text: ''
                                },
                                {
                                    xtype: 'label',
                                    x: 280,
                                    y: 70,
                                    height: 20,
                                    id: 'cfecha_amarillo',
                                    text: ''
                                },
                                {
                                    xtype: 'label',
                                    x: 280,
                                    y: 100,
                                    height: 20,
                                    id: 'cfecha_rojo',
                                    text: ''
                                },
                                {
                                    xtype: 'label',
                                    x: 280,
                                    y: 40,
                                    id: 'cfecha_meta',
                                    text: ''
                                }
                            ]
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }
});

function asignarDetalleIndicadorCon1() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc1
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (id_indicadorc1 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				if (datos.exito == 'false') {
					Ext.Msg.alert("Error", datos.msg);
				} else {
					Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
					Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
					Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
					Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
					Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
					Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
					Ext.getCmp('cnombre_resp').setText(datos.responsable);
					Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
					Ext.getCmp('ctelefono_resp').setText(datos.telefono);
				}
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon2() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc2
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (id_indicadorc2 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				if (datos.exito == 'false') {
					Ext.Msg.alert("Error", datos.msg);
				} else {
					Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
					Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
					Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
					Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
					Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
					Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
					Ext.getCmp('cnombre_resp').setText(datos.responsable);
					Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
					Ext.getCmp('ctelefono_resp').setText(datos.telefono);
				}
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon3() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc3
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (id_indicadorc3 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				if (datos.exito == 'false') {
					Ext.Msg.alert("Error", datos.msg);
				} else {
					Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
					Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
					Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
					Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
					Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
					Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
					Ext.getCmp('cnombre_resp').setText(datos.responsable);
					Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
					Ext.getCmp('ctelefono_resp').setText(datos.telefono);
				}
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon4() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc4
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (id_indicadorc4 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				if (datos.exito == 'false') {
					Ext.Msg.alert("Error", datos.msg);
				} else {
					Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
					Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
					Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
					Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
					Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
					Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
					Ext.getCmp('cnombre_resp').setText(datos.responsable);
					Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
					Ext.getCmp('ctelefono_resp').setText(datos.telefono);
				}
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon5() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc5
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (id_indicadorc5 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				if (datos.exito == 'false') {
					Ext.Msg.alert("Error", datos.msg);
				} else {
					Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
					Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
					Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
					Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
					Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
					Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
					Ext.getCmp('cnombre_resp').setText(datos.responsable);
					Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
					Ext.getCmp('ctelefono_resp').setText(datos.telefono);
				}
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon6() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadoc6
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (id_indicadorc6 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				if (datos.exito == 'false') {
					Ext.Msg.alert("Error", datos.msg);
				} else {
					Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
					Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
					Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
					Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
					Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
					Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
					Ext.getCmp('cnombre_resp').setText(datos.responsable);
					Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
					Ext.getCmp('ctelefono_resp').setText(datos.telefono);
				}
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon7() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc7
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (id_indicadorc7 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				if (datos.exito == 'false') {
					Ext.Msg.alert("Error", datos.msg);
				} else {
					Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
					Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
					Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
					Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
					Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
					Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
					Ext.getCmp('cnombre_resp').setText(datos.responsable);
					Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
					Ext.getCmp('ctelefono_resp').setText(datos.telefono);
				}
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon8() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc8
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (id_indicadorc8 == null) {
				Ext.Msg.alert("Información", 'No se ha definido ningun indicador, seleccione otro');
			} else {
				if (datos.exito == 'false') {
					Ext.Msg.alert("Error", datos.msg);
				} else {
					Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
					Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
					Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
					Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
					Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
					Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
					Ext.getCmp('cnombre_resp').setText(datos.responsable);
					Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
					Ext.getCmp('ctelefono_resp').setText(datos.telefono);
				}
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon9() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc9
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
				Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
				Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
				Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
				Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
				Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
				Ext.getCmp('cnombre_resp').setText(datos.responsable);
				Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
				Ext.getCmp('ctelefono_resp').setText(datos.telefono);
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}

function asignarDetalleIndicadorCon10() {
	Ext.Ajax.request({
		url : 'menu_ensambladora/generarDataUsuarioIndicador',
		params : {
			ajax : 'true',
			funcion : 'generarDataUsuarioIndicador',
			idindicador : id_indicadorc10
		},
		success : function(exito, request) {
			datos = Ext.JSON.decode(exito.responseText);
			if (datos.exito == 'false') {
				Ext.Msg.alert("Error", datos.msg);
			} else {
				Ext.getCmp('cvalor_meta').setText(datos.valor_meta);
				Ext.getCmp('cfecha_meta').setText(datos.fecha_meta);
				Ext.getCmp('cvalor_amarillo').setText(datos.valor_amarillo);
				Ext.getCmp('cvalor_rojo').setText(datos.valor_rojo);
				Ext.getCmp('cfecha_amarillo').setText(datos.fecha_amarillo);
				Ext.getCmp('cfecha_rojo').setText(datos.fecha_rojo);
				Ext.getCmp('cnombre_resp').setText(datos.responsable);
				Ext.getCmp('ccorreo_resp').setText(datos.correo_responsable);
				Ext.getCmp('ctelefono_resp').setText(datos.telefono);
			};

		},
		failure : function() {
			Ext.Msg.alert("Error", "Servidor NO Conectado!!");
		}
	});
}


