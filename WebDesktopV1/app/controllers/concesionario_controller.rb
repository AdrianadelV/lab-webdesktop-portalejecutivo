class ConcesionarioController < ApplicationController
  def index
    if(session[:nombre_login]==nil)
      redirect_to '/inicio'
    elsif(session[:id_rol]=='1')
      redirect_to '/cli_comprador'
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
end
