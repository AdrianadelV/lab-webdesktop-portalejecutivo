class CliCompradorController < ApplicationController
  def index
    if(session[:nombre_login]==nil)
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
    @arbols = Portal_ejecutivo_desktops.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
end
