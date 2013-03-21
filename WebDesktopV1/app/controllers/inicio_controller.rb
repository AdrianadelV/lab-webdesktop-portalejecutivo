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
    id = params[:id]
    @modelos = Modelo_Vehiculo.new
    valor = @modelos.buscarModelosMarca(id)
    render :text => $tirajson
  end
  def autenticarUsuario
    nombre = params[:nombre]
    password = params[:password]
    @usuarios = Usuario.new
    valor = @usuarios.autenticarUsuario(nombre,password)
    if (valor==1)
       parsed_json = ActiveSupport::JSON.decode($tirajson)
       session[:nombre]=nombre
       session[:contrasena]=password
       session[:rols_id]= parsed_json["rols_id"]
    end
    render :text => $tirajson
  end
end
