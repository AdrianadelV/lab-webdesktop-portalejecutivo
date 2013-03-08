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

Ext.onReady(function(){
		
	Ext.define('VentaRegistrarUsuario', {
		extend : 'Ext.window.Window',
		
	// initComponent : function() {
      // this.dockedItems = [ {
        // dock: 'bottom',
        // buttons: [{
          // text: 'Ir a Pagina Principal',
          // handler: function() {
           // location.href="inicio"
          // }
        // },{
          // text: 'Limpiar',
    	  // icon: 'images/limpiar.png',
          // handler: function() {
           // Ext.getCmp('VentaRegistrarUsuario').getForm().reset();
           // Ext.getCmp('cedula').focus();
          // }
        // },{
         // text: 'Cargar',
         // icon: 'images/grabar.png',
         // formBind: true, // Disponible hasta que los campos esten validados
         // disabled: true,
         // // handler: function() {
          // // enviar();  
         // // }
        // }
        // ]
// 
        // } ];
		
		height : 439,
		width : 635, 
		y : 180,
		layout : {
			type : 'absolute'
		},
		title : 'Registrarse',
		items : [{
			xtype : 'textfield',
			x : 20,
			y : 30,
			width : 270,
			allowBlank: false,
			blankText: 'Campo  Oblicagorio',
			name: 'cedula',
          	id: 'cedula',
			fieldLabel : 'Cedula'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 70,
			width : 270,
			id: 'nombre',
			allowBlank: false,
			blankText: 'Campo  Oblicagorio',
			fieldLabel : 'Nombre'
		}, {
			xtype : 'textfield',
			x : 320,
			y : 70,
			width : 280,
			id:'apellidos',
			allowBlank: false,
			blankText: 'Campo  Oblicagorio',
			fieldLabel : 'Apellido'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 120,
			width : 270,
			id: 'telefono',
			allowBlank: false,
			blankText: 'Campo  Oblicagorio',
			fieldLabel : 'Telefono'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 170,
			width : 580,
			id: 'direccion',
			allowBlank: false,
			blankText: 'Campo  Oblicagorio',
			fieldLabel : 'Direccion'
		}, {
			xtype : 'combobox',
			x : 320,
			y : 120,
			width : 280,
			fieldLabel : 'Sexo'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 220,
			width : 350,
			allowBlank: false,
			id: 'email',
			blankText: 'Campo  Oblicagorio',
			fieldLabel : 'email'
		}, {
			xtype : 'label',
			x : 320,
			y : 30,
			height : 20,
			width : 220,
			text : 'Rol: Cliente Comprador'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 270,
			width : 350,
			id: 'contrsena',
			allowBlank: false,
			blankText: 'Campo  Oblicagorio',
			inputType: 'password',
			fieldLabel : 'Contraseña'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 320,
			width : 350,
			id:'contrasena2',
			allowBlank: false,
			blankText: 'Campo  Oblicagorio',
			inputType: 'password',
			fieldLabel : 'Confirmar Contraseña'
		}, {
			xtype : 'button',
			icon: 'images/grabar.png',
         	formBind: true,
			x : 530,
			y : 360,
			width : 78,
			height : 30,
			text : 'Grabar',
		
			// handler: function() {
// 
            // Ext.Ajax.request({
             // url: 'registrarusuario/grabar',
             // //Enviando los parametros a la pagina servidora
             // params: {
              // ajax: 'true',
              // funcion: 'grabar',
              // nombre: Ext.getCmp('cedula').getValue(), //obtiene el valor a traves del id del campo
              // correo: Ext.getCmp('nombres').getValue(),
              // twitter: Ext.getCmp('apellidos').getValue(),
              // celular: Ext.getCmp('telefono').getValue(),
              // direccion: Ext.getCmp('direccion').getValue(),
              // telefono: Ext.getCmp('correo').getValue(),
             // },
             // //Retorno exitoso de la pagina servidora a traves del formato JSON
             // success: function( resultado, request ) {
              // datos=Ext.JSON.decode(resultado.responseText);
              // Ext.Msg.alert('Mensaje', datos.msg);
             // },
             // //No hay retorno de la pagina servidora
             // failure: function() {
              // Ext.Msg.alert("Error", "Servidor no conectado!");
             // }
            // });
         // },
			
				listeners: {
					click:function(){
						// alert('Registro Existoso');


					Ext.Ajax.request({
						url : 'registrarusuario/grabar',
						//Enviando los parametros a la pagina servidora
						params : {
							ajax : 'true',
							funcion : 'grabar',
							nombre : Ext.getCmp('cedula').getValue(), //obtiene el valor a traves del id del campo
							correo : Ext.getCmp('nombres').getValue(),
							twitter : Ext.getCmp('apellidos').getValue(),
							celular : Ext.getCmp('telefono').getValue(),
							direccion : Ext.getCmp('direccion').getValue(),
							telefono : Ext.getCmp('correo').getValue(),
						},
						//Retorno exitoso de la pagina servidora a traves del formato JSON
						success : function(resultado, request) {
							datos = Ext.JSON.decode(resultado.responseText);
							Ext.Msg.alert('Mensaje', datos.msg);
						},
						//No hay retorno de la pagina servidora
						failure : function() {
							Ext.Msg.alert("Error", "Servidor no conectado!");
						}
					}); 



					}
			  },
			    // url:'cli_comprador'
		},{
			xtype : 'button',
			icon: 'images/limpiar.png',
         	formBind: true,
			x : 430,
			y : 360,
			width : 78,
			height : 30,
			text : 'Limpiar',
			listeners: {
					click:function(){
						Ext.getCmp('VentaRegistrarUsuario').getForm().reset();
           				Ext.getCmp('cedula').focus();
					}
			  },
		}]

	}); 
	ventanaregistrarusuario= Ext.create('VentaRegistrarUsuario')
		ventanaregistrarusuario.show();
	
		
});
