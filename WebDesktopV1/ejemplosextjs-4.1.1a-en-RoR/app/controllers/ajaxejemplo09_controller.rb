=begin
  ajaxejemplo09_controller.rb
  Autor      : Edgar Gonzalez
  Version    : 1.0 
  Fecha      : 14 de noviembre del 2012
  Descripcion: Atiende clientes via AJAX y crea un atributo a ser renderizado 
               en la vista como response en formato JSON al AJAX. Este atributo 
               es creado dinamicamente con datos extraidos de una tabla
=end
class Ajaxejemplo09Controller < ApplicationController

 def index
   @usuarios = Usuarios.all
   @son = Usuarios.count
   @i=1
   @tirajson = '{ "datos": [ '
   @usuarios.each do |usuario|
    if @i<@son
      @tirajson = @tirajson + ' { "usuario": "' + usuario.usuario + '", "clave": "' + usuario.clave + '", "nivel": "' + usuario.nivel + '"},'
    else
      @tirajson = @tirajson + ' { "usuario": "' + usuario.usuario + '", "clave": "' + usuario.clave + '", "nivel": "' + usuario.nivel + '"}'
    end
    @i=@i+1
   end
   @tirajson = @tirajson + ' ] }'
   render :text => @tirajson
   #respond_to do |format|
    #format.String  # index.html.erb
    #format.json  { render :json => @usuarios }
   #end
 end
 
end