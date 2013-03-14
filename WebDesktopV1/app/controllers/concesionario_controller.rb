class ConcesionarioController < ApplicationController
  def index
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:rol_id]=='1')
      redirect_to '/cli_comprador'
    elsif(session[:rol_id]=='3')
      redirect_to '/menu_ensambladora'
    elsif(session[:rol_id]=='4')
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
