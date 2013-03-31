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
  def buscarIdMarca
   @marcas = Marca.new
   id_marca = params[:id_marca]
   valor = @marcas.buscarMarca(id_marca)
   render :text => $tirajson
  end
  #Adriana. Esta funcion busca todos los modelos de una marca en especifico
  def buscarModelos
    id_marca = params[:id_marca]
    @modelos = Modelo_Vehiculo.new
    @objmodelos = @modelos.buscarModelosMarca(id_marca)
    parsed_json = ActiveSupport::JSON.decode($tirajson)
    i=0
    @objmodelos.each do |modelo|
        #puts @objmodelo.imagen1
        @modelos.creararchivofisico(modelo.descripcion+'.jpg',$directorio_raiz+'/public/images/modelovehiculo/',modelo.imagen1)
        parsed_json[i]["imagen3"]="images/modelovehiculo/"+modelo.descripcion+'.jpg'
        parsed_json[i]["imagen1"]=""
        i=i+1
    end
    $tirajson =  parsed_json.to_json
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
