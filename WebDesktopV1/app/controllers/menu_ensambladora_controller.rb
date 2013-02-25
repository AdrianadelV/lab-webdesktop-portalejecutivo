class MenuEnsambladoraController < ApplicationController
  def index
  end
  
  def generar_menu
    @tipo=params[:tipo]
    @menu_ensambladora = MenuEnsambladora.new
    @tira = @menu_ensambladora.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
end
