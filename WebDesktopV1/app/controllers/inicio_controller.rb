class InicioController < ApplicationController
  def index
  end 
   def generarmenu
    @arbols = Marca.new
    @tira = @arbols.generarArbol()
    render :text => @tira
  end
  def buscar
   @marcas = Marca.new
   id_marca = params[:id_marca]
   valor = @marcas.buscar(id_marca)
   render :text => $tirajson
  end
  def buscarModelos
    puts 'hola'
    id_marca = params[:id_marca]
    @modelos = Modelo_Vehiculo.new
    valor = @modelos.buscarModelosMarca(id_marca)
    render :text => $tirajson
  end
  def autenticarUsuario
    id_usuario = params[:id_usuario]
    password = params[:password]
    @usuarios = Usuario.new
    valor = @usuarios.autenticarUsuario(id_usuario,password)
    render :text => $tirajson
  end
end
