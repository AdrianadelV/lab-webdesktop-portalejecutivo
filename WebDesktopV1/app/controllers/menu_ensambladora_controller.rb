class MenuEnsambladoraController < ApplicationController
  def index
    puts session[:nombre_login]
    if(session[:nombre_login]==nil)
      redirect_to '/inicio'
    end 
  end
  
  def generar_menu
    @tipo=params[:tipo]
    @arbols = Portal_ejecutivo_desktops.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
end
