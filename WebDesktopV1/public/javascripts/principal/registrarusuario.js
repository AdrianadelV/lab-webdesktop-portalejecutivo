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
		items : [
						{
                            xtype: 'textfield',
                            x: 0,
                            y: 70,
                            width: 200,
                            fieldLabel: 'Cedula',
                            id : 'cedula'
                        },  {
                            xtype: 'textfield',
                            x: 0,
                            y: 110,
                            width: 290,
                            fieldLabel: 'Nombres',
                            id : 'nombres'
                        }, {
                            xtype: 'textfield',
                            x: 0,
                            y: 150,
                            width: 290,
                            fieldLabel: 'Apellidos',
                            id : 'apellidos'
                        }, {
                            xtype: 'textfield',
                            x: 0,
                            y: 190,
                            width: 250,
                            fieldLabel: 'Telefono',
                            id : 'telefono'
                        }, {
                            xtype: 'textfield',
                            x: 260,
                            y: 150,
                            fieldLabel: 'Correo',
                            id : 'correo'
                        },{
                            xtype: 'textfield',
                            x: 260,
                            y: 190,
                            fieldLabel: 'Repetir Correo',
                            id : 'correo2'
                        },{
                            xtype: 'textfield',
                            x: 0,
                            y: 230,
                            width: 430,
                            fieldLabel: 'Direccion',
                            id : 'direccion'
                        },{
                            xtype: 'datefield',
                            x: 260,
                            y: 70,
                            fieldLabel: 'Fecha de nacimiento',
                            id : 'fecha_nacimiento'
                        }, {
                            xtype: 'combobox',
                            x: 260,
                            y: 110,
                            width: 200,
                            fieldLabel: 'Sexo',
                            id : 'sexo'
                        }, {
                            xtype: 'textfield',
                            x: 0,
                            y: 260,
                            fieldLabel: 'Nombre de usuario',
                            id : 'nusuario'
                            
                        }, {
                            xtype: 'textfield',
                            x: 0,
                            y: 300,
                            fieldLabel: 'Contraseña',
                            id : 'password'
                            
                        },{
                            xtype: 'textfield',
                            x: 0,
                            y: 330,
                            fieldLabel: 'Repetir contraseña',
                            id : 'password2'
                        },{
							xtype : 'button',
							x : 440,
							y : 300,
							text : 'Registrar',
							listeners: {
								click:function(){
								alert('Registro Existoso');
								//Ext.Ajax.request({
								//url: 'inicio/grabarcli',
             
            				  // ajax: 'true',
            					  // funcion: 'grabar',
              					cedula: Ext.getCmp('cedula').getValue() //obtiene el valor a traves del id del campo
              					nombres: Ext.getCmp('nombres').getValue()
                				apellidos: Ext.getCmp('apellidos').getValue()
              					telefono: Ext.getCmp('telefono').getValue()
              					direccion: Ext.getCmp('direccion').getValue()
              					correo: Ext.getCmp('correo').getValue()
              					fecha_nacimiento: Ext.getCmp('fecha_nacimiento').getValue()
              					sexo: Ext.getComp('sexo').getValue()
              					nusuario: Ext.getComp('nusuario').getValue()
              					password: Ext.getComp('password').getValue()
             			
								}
			 			 	},
			    			url:'cli_comprador'
						},{
							xtype : 'button',
							x : 360,
							y : 300,
							text : 'Cancelar'
							}
		]

	}); 
	ventanaregistrarusuario= Ext.create('VentaRegistrarUsuario')
		ventanaregistrarusuario.show();
	
		
});
