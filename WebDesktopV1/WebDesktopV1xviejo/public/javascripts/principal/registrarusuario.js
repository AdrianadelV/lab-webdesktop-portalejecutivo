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
			fieldLabel : 'Cedula'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 70,
			width : 270,
			fieldLabel : 'Nombre'
		}, {
			xtype : 'textfield',
			x : 320,
			y : 70,
			width : 280,
			fieldLabel : 'Apellido'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 120,
			width : 270,
			fieldLabel : 'Telefono'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 170,
			width : 580,
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
			fieldLabel : 'Contraseña'
		}, {
			xtype : 'textfield',
			x : 20,
			y : 320,
			width : 350,
			fieldLabel : 'Confirmar Contraseña'
		}, {
			xtype : 'button',
			x : 530,
			y : 360,
			text : 'Registrar',
				listeners: {
					click:function(){
						alert('Registro Existoso');
					}
			  },
			    url:'cli_comprador'
		},{
			xtype : 'button',
			x : 450,
			y : 360,
			text : 'Cancelar'
		}]

	}); 
	ventanaregistrarusuario= Ext.create('VentaRegistrarUsuario')
		ventanaregistrarusuario.show();
	
		
});
