class CliCompradorController < ApplicationController
  def index
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:rols_id]==2)
      redirect_to '/concesionario'
    elsif(session[:rols_id]==3)
      redirect_to '/menu_ensambladora'
    elsif(session[:rols_id]==4)
      redirect_to '/menu_admin'
    end
  end

  def generarmenu
    @tipo=params[:tipo]
    @arbols = Arbols.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
   def buscarUsuarioLo
   @usuarios = Usuario.new
   valor = @usuarios.buscarUsuarioLo(session[:nombre])
  end
  def buscarComprador
    buscarUsuarioLo()
    parsed_json = ActiveSupport::JSON.decode($tirajson)
    @comprador=Comprador_Vehiculo.new
    valor=@comprador.buscarUsuarioComprador(parsed_json["id"])
    render :text => $tirajson 
  end
  
  def grabarComprador  
    @comprador= Comprador_Vehiculo.new
    parsed_json = ActiveSupport::JSON.decode($tirajson)
    @cedula=params[:cedula]
    @nombres=params[:nombres]
    @apellidos=params[:apellidos]
    @telefono=params[:telefono]
    @direccion=params[:direccion]
    @correo=params[:correo]
    @fecha_nacimiento=params[:fecha_nacimiento]
    @sexo=params[:sexo]
    @comprador.grabarComprador(@cedula,@nombres,@apellidos,@telefono,@direccion,@correo,@fecha_nacimiento,@sexo)
    render :text => $tirajson
  end
  
  def modificarContrasena
    @usuario = Usuario.new
    @nombre = params[:nombre]
    @canterior=params[:canterior]
    @cnueva=params[:cnueva]
    @usuario.modificarContrasena(@nombre,@canterior,@cnueva,)
    render :text => $tirajson
  end
end
