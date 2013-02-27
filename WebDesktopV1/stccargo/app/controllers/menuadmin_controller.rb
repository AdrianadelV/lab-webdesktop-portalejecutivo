class MenuadminController < ApplicationController
  def index
   #usuario = session[:usuario]
   #clave = session[:clave]
   usuario = $usuario_stccargo
   clave = $clave_stccargo
   if (usuario!="" and clave!="")
    @usuario = Stccargo_usuarios.new
    @usuario.validarSesion(usuario,clave)
    @accion = ":::Menu Administrador"
   else
    session[:mensajeError] = "No tiene privilegios de acceder esta pagina"
    session[:vinculo] = "/acceso"
    redirect_to '/informacion'
   end
  end
  def generarmenu
    @tipo=params[:tipo]
    @arbols = Arbols.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
  def salir
    #session[:usuario] = ""
    #session[:clave] = ""
    $usuario_stccargo = ""
    $clave_stccargo = ""
    redirect_to '/acceso'
 end
end