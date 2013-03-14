class MenuEnsambladoraController < ApplicationController
  def index
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:rol_id]=='1')
      redirect_to '/cli_comprador'
    elsif(session[:rol_id]=='2')
      redirect_to '/concesionario'
    elsif(session[:rol_id]=='4')
      redirect_to '/menu_admin'
    end
  end

  def generar_menu
    @tipo=params[:tipo]
    @arbols = Arbols.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
end
