class CliCompradorController < ApplicationController
  def index
  end
   def generarmenu
    @tipo=params[:tipo]
    @arbols = Portal_ejecutivo_desktops.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
end
