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

Ext.define('proformas', {
    extend: 'Ext.window.Window',
	height: 600,
    width: 950,
    html:'<HTML><BODY><embed src="proforma.pdf" type="application/pdf" width="100%" height="100%"></BODY></HTML>',
    x:370,
    y:210,
    layout: {
        type: 'absolute'
    },
    title: 'Proforma de Credito para Vehiculos',
    initComponent: function() {
        var me = this;

        me.callParent(arguments);
    }

});

