#leer: http://guides.rubyonrails.org/security.html
class AccesoController < ApplicationController
  def index
  end
  
  def validarsesion
   @usuario = params[:usuario]
   @clave = params[:clave]
   @objusuario = Stccargo_usuarios.new
   @valor = @objusuario.buscar(@usuario, @clave)
   if @valor==1
     #session[:usuario] = @usuario.to_s
     #session[:clave] = @clave.to_s
     $usuario_stccargo = @usuario.to_s
     $clave_stccargo = @clave.to_s
     @tirajson = '{"success": "true", "exito": "true", "url": "menuadmin" }';
   else
     @tirajson = '{ "success": "false" }';
   end

   render :text => @tirajson
   #respond_to do |format|
    #format.String  # index.html.erb
    #format.json  { render :json => @usuarios }
   #end
  end
end