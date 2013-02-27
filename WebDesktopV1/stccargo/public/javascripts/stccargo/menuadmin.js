  //Calcular las posiciones x,y segun la resolucion del monitor del cliente para el tabpanel por ser un layout absolute
   var posx = 0;
   var posy = 0;
   var factorw = 0;
   var factorh = 0;
   //1024x768
   if (screen.width==1024 && screen.height==768)
   {
    factorw = 0.020;
    factorh = 0.10;
   }
   //1280x800
   if (screen.width==1280 && screen.height==800)
   {
    factorw = 0.10;
    factorh = 0.10;
   }
   //1280x1024
   if (screen.width==1280 && screen.height==1024)
   {
    factorw = 0.025;
    factorh = 0.10;
   }
posx = parseInt(screen.width * factorw);
posy = parseInt(screen.height * factorh);

Ext.onReady(function() {
    Ext.QuickTips.init();
      new Ext.Panel({
        layout: 'absolute',
        x:posx,
        y:posy,
        width: 150,
        height: 50,
        title: "Opciones Administrador",
        tbar: {
         enableOverflow: true,
         items: [{
          xtype: 'button',
          text: 'Actualizar',
          menu: {
           plain: true,
           showSeparator: false,
           items: [{
            text: 'Inicio',
            handler: function() {
              location.href="menuadmin"
            }
           },
     {
            text: 'Datos',
            handler: function() {
              location.href="actualizardatos"
            }
           },
           {
            text: 'Transportistas',
            handler: function() {
              alert("Hacer como tarea basandose en el ejemplo de PHP");
            }
           }]
          }
         },
         {
          xtype: 'tbspacer',
          width: 20
         },
         {
          xtype: 'button',
           text: 'Salir',
           handler: function() {
              location.href="menuadmin/salir"
            } 
         }]
        },
        renderTo: 'menu'
    });

});


