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

 Ext.onReady(function() {
    Ext.QuickTips.init();
      new Ext.Panel({
        layout: 'absolute',
        x:posx,
        y:posy,
        width: 200,
        height: 50,
        title: "Opciones",
        tbar: {
         enableOverflow: true,
         items: [
          {
          xtype: 'button',
           text: 'Inicio',
           handler: function() {
              location.href="inicio"
            }
         },
         {
          xtype: 'button',
          text: 'Transportistas',
          menu: {
           plain: true,
           showSeparator: false,
           items: [ { text: 'Transportista Orinoco', handler: function() { alert('En Construccion'); } }
                  ]
          }
         },
         {
          xtype: 'button',
           text: 'Contacto',
           handler: function() {
        	   alert('En Construccion'); 
            } 
         }]
        },
        renderTo: 'menu'
    });

  });





