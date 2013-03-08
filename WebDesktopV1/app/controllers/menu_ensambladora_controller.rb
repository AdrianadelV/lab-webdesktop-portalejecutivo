class MenuEnsambladoraController < ApplicationController
  def index
    if(session[:nombre_login]==nil)
      redirect_to '/inicio'
    elsif(session[:id_rol]=='1')
      redirect_to '/cli_comprador'
    elsif(session[:id_rol]=='2')
      redirect_to '/concesionario'
    elsif(session[:id_rol]=='4')
      redirect_to '/menu_admin'
    end
  end

  def generar_menu
    @tipo=params[:tipo]
    @arbols = Portal_ejecutivo_desktops.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
end
