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
		
	Ext.define('registrarusuario', {
    extend: 'Ext.window.Window',

    height: 293,
    width: 660,
    title: 'Ventana de registro',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'form',
                    height: 254,
                    width: 637,
                    layout: {
                        type: 'absolute'
                    },
                    bodyPadding: 10,
                    title: 'Crear cuanta de usuario',
                    items: [
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 20,
                            width: 200,
                            fieldLabel: 'Cedula',
                            id : 'cedula'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 50,
                            width: 290,
                            fieldLabel: 'Nombres',
                            id : 'nombres'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 80,
                            width: 290,
                            fieldLabel: 'Apellidos',
                            id : 'apellidos'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 110,
                            width: 250,
                            fieldLabel: 'Telefono',
                            id : 'telefono'
                        },
                        {
                            xtype: 'textfield',
                            x: 340,
                            y: 100,
                            fieldLabel: 'Correo',
                            id : 'correo'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 140,
                            width: 430,
                            fieldLabel: 'Direccion',
                            id : 'direccion'
                        },
                        {
                            xtype: 'datefield',
                            x: 340,
                            y: 20,
                            fieldLabel: 'Fecha de nacimiento',
                            id : 'fecha_nacimiento'
                        },
                        {
                            xtype: 'combobox',
                            x: 340,
                            y: 60,
                            width: 200,
                            fieldLabel: 'Sexo',
                            id : 'sexo'
                        },
                        {
                            xtype: 'textfield',
                            x: 20,
                            y: 170,
                            fieldLabel: 'Nombre de usuario',
                            id : 'nusuario'
                            
                        },
                        {
                            xtype: 'textfield',
                            x: 280,
                            y: 170,
                            fieldLabel: 'Contraseña',
                            id : 'password'
                            
                        },
                        {
                            xtype: 'textfield',
                            x: 280,
                            y: 190,
                            fieldLabel: 'Repetir contraseña',
                            id : 'password2'
                        },
                        {
                            xtype: 'button',
                            x: 550,
                            y: 160,
                            text: 'Grabar'
                            handler: function() {
 
            					Ext.Ajax.request({
             					url: 'inicio/grabarcli',
             
            				  // ajax: 'true',
            					  // funcion: 'grabar',
              					cedula: Ext.getCmp('cedula').getValue(), //obtiene el valor a traves del id del campo
              					nombres: Ext.getCmp('nombres').getValue(),
                				apellidos: Ext.getCmp('apellidos').getValue(),
              					telefono: Ext.getCmp('telefono').getValue(),
              					direccion: Ext.getCmp('direccion').getValue(),
              					correo: Ext.getCmp('correo').getValue(),
              					fecha_nacimiento: Ext.getCmp('fecha_nacimiento').getValue(),
              					sexo: Ext.getComp('sexo').getValue(),
              					nusuario: Ext.getComp('nusuario').getValue(),
              					password: Ext.getComp('password').getValue(),
             			},
                        },
                        {
                            xtype: 'button',
                            x: 550,
                            y: 190,
                            text: 'Cancelar'
                        }
                    ]
                }
            ]
        });

        me.callParent(arguments);
    }

});
	ventanaregistrarusuario= Ext.create('VentaRegistrarUsuario')
		ventanaregistrarusuario.show();
	
		
});
