class CliCompradorController < ApplicationController
  def index
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:id_rol]=='2')
      redirect_to '/concesionario'
    elsif(session[:id_rol]=='3')
      redirect_to '/menu_ensambladora'
    elsif(session[:id_rol]=='4')
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
    id_usuario = params[:id_usuario]
    @usuarios = Usuario.new
    if (session[:nombre_login]==id_usuario)
      puts id_usuario
      valor = @usuarios.buscarUsuarioLo(id_usuario)
      render :text => @tira
    end
  end
end
