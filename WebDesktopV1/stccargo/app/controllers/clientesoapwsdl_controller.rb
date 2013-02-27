require 'soap/wsdlDriver'
=begin
 Si al ejecutarlo da un error como el siguiente:
 
   xml processor module not found
    
 Basado en el foro de http://railsforum.com/viewtopic.php?id=41231
 Hacer lo siguiente:
 
 1.- Abrir una consola de linux o termimal
 2.- Editar el archivo: xmlparser.rb ubicado en /usr/lib/ruby/gems/1.9.1/gems/soap4r-1.5.8/lib/xsd
     Ejemplo:
     --------
     $ sudo kate /usr/lib/ruby/gems/1.9.1/gems/soap4r-1.5.8/lib/xsd/xmlparser.rb
 3.- Presionar F11 para ver las el numero de lineas del archivo fuente xmlparser.rb 
 4.- Ubicar la linea 66 la instruccion: c.downcase == name
     y cambiarla por: c.to_s.downcase == name 
     Grabar
 5.- Por ultimo, vuelva a ejecutar este controlador 
 
=end
class ClientesoapwsdlController < ApplicationController
 def index
  begin
   @accion = ":::Cliente Soap Wsdl" 
   wsdl_url = $hostwsdl+'intt/app/public/wsdl/intt.wsdl'
   wsdlFactory = SOAP::WSDLDriverFactory.new(wsdl_url).create_rpc_driver
   placa = 'AA123AA'
   valor = wsdlFactory.buscarmultaxplaca(placa)
   if valor=="0" 
    @mensajeplaca = "La placa "+placa+" NO tiene multas"
   else
    @mensajeplaca = "La placa "+placa+" SI tiene multas"
   end
  rescue
   session[:mensajeError] = "Error: Servidor Soap WSDL no se esta ejecutando"
   session[:vinculo] = $host+"inicio"
   redirect_to $host+'informacion'
  end
 end
end
