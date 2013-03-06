class InicioController < ApplicationController
  def index
  end 
   def generarmenu
    @tipo=params[:tipo]
    @arbols = Portal_ejecutivo_desktops.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
  def buscar
   @marcas = Marca.new
   id_marca = params[:id_marca]
   valor = @marcas.buscar(id_marca)
   render :text => $tirajson
  end
end
