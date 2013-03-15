class CliCompradorController < ApplicationController
  def index
    
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:rol_id]==2)
      redirect_to '/concesionario'
    elsif(session[:rol_id]==3)
      redirect_to '/menu_ensambladora'
    elsif(session[:rol_id]==4)
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
    puts $tirajson
    parsed_json = ActiveSupport::JSON.decode($tirajson)
    @comprador=Comprador_Vehiculo.new
    valor=@comprador.buscarUsuarioComprador(parsed_json["id"])
    puts $tirajson
     render :text => $tirajson
  end
end
