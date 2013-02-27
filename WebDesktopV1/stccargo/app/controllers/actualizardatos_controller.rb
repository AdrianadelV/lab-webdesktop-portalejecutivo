class ActualizardatosController < ApplicationController
  def index
   #usuario = session[:usuario]
   #clave = session[:clave]
   usuario = $usuario_stccargo
   clave = $clave_stccargo
   if (usuario!="" and clave!="")
    @usuario = Stccargo_usuarios.new
    @usuario.validarSesion(usuario,clave)
    @accion = ":::Actualizar Datos"
   else
    session[:mensajeError] = "No tiene privilegios de acceder esta pagina"
    session[:vinculo] = "/inicio"
    redirect_to '/informacion'
   end
  end

  def cargar
   #usuario = session[:usuario]
   #clave = session[:clave]
   usuario = $usuario_stccargo
   clave = $clave_stccargo
   if (usuario!="" and clave!="")
    @usuario = Stccargo_usuarios.new
    valor = @usuario.cargar(usuario,clave)
    render :text => $tirajson
   else
    session[:mensajeError] = "No tiene privilegios de acceder esta pagina"
    session[:vinculo] = "/inicio"
    redirect_to '/informacion'
   end
  end
  
  def grabar
   #usuario = session[:usuario]
   #clave = session[:clave]
   usuario = $usuario_stccargo
   clave = $clave_stccargo
   if (usuario!="" and clave!="")
    @datos = []
    @datos[0] = params[:nombre]
    @datos[1] = params[:correo]
    @datos[2] = params[:twitter]
    @datos[3] = params[:celular]
    @datos[4] = params[:direccion]
    @datos[5] = params[:telefono]
    @datos[6] = params[:cn1]
    @datos[7] = params[:cn2]
    @usuario = Stccargo_usuarios.new
    valor = @usuario.grabar(usuario,clave,@datos)
    render :text => $tirajson
   else
    session[:mensajeError] = "No tiene privilegios de acceder esta pagina"
    session[:vinculo] = "/inicio"
    redirect_to '/informacion'
   end
  end
  
end