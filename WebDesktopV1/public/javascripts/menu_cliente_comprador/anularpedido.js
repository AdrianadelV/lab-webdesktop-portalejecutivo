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

Ext.define('anularpedido', {
    extend: 'Ext.window.Window',

    height: 289,
    width: 490,
    x:370,
    y:210,
    layout: {
        type: 'absolute'
    },
    title: 'Anular Pedido',

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'combobox',
                    x: 60,
                    y: 40,
                    fieldLabel: 'Anular Pedido'
                },
                {
                    xtype: 'textareafield',
                    x: 60,
                    y: 90,
                    fieldLabel: 'Descripcion'
                },
                {
                    xtype: 'button',
                    x: 210,
                    y: 190,
                    text: 'Aceptar'
                },
                {
                    xtype: 'button',
                    x: 300,
                    y: 190,
                    text: 'Cancelar'
                }
            ]
        });

        me.callParent(arguments);
    }

});
