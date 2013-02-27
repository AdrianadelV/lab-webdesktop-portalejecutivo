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

Ext.define('catalogo', {
	extend : 'Ext.window.Window',
	height : 600,
	width : 900,
	x : 370,
	y : 210,
	//html : '<img src="images/camioneta.jpg" width="139" height="96" border="5" /><img src="images/camioneta1.jpg" width="139" height="96" border="5" /><img src="images/camioneta2.jpg" width="139" height="96" border="5" /><img src="images/camionotros.jpg" width="139" height="96" border="5" /><img src="images/carrodaewood.jpg" width="139" height="96" border="5" /><img src="images/Daewoo.jpg" width="139" height="96" border="5" />',
	html:'<iframe  height="600" width="900" src="catalogo.html"></iframe>',
	layout : {
		type : 'absolute'
	},
	title : 'Catalogo Vehiculos',
	initComponent : function() {
		var me = this;
		me.callParent(arguments);
	}
});
