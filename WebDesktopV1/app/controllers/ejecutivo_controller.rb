class EjecutivoController < ApplicationController
  def index
  end
   def generarmenu
    @tipo=params[:tipo]
    @arbols = Menu_ejecutivo.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
end
