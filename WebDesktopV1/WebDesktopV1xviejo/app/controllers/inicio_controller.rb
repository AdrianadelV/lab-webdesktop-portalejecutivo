class InicioController < ApplicationController
  def index
  end 
   def generarmenu
    @tipo=params[:tipo]
    @arbols = Inicio.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
end
