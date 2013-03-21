class MenuAdminController < ApplicationController
  def index
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:rols_id]==1)
      redirect_to '/cli_comprador'
    elsif(session[:rols_id]==2)
      redirect_to '/concesionario'
    elsif(session[:rols_id]==3)
      redirect_to '/menu_ensambladora'
    end
  end

  def generar_menu
    @tipo=params[:tipo]
    @arbols = Arbols.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end

  def grabar_marca
    @marca= Marca.new
    @nombre=params[:nombre]
    @imagen=params[:imagen]
    @mision=params[:mision]
    @vision=params[:vision]
    @valores=params[:valores]
    @contacto=params[:contacto]
    @marca.grabar_marca(@nombre,@imagen,@mision,@vision,@valores,@contacto)
    render :text => $tirajson
  end
  
  def buscar_marca
    @marca = Marca.new
   nombre = params[:nombre]
   valor = @marca.busca_marca_existe(nombre)
   render :text => $tirajson
  end
  
   def generardatacombosestados
   @estados = Estados.all
   @son = Estados.count
   @i=1
   @tirajson = '[ '
   @estados.each do |estado|
    if @i<@son
      @tirajson = @tirajson + ' { "id": "'+@i.to_s+'", "nombre": "' + estado.nombre + '"},'
    else
      @tirajson = @tirajson + ' { "id": "'+@i.to_s+'", "nombre": "' + estado.nombre + '"} '
    end
    @i=@i+1
   end
   @tirajson = @tirajson + ' ] '
   render :text => @tirajson
  end
  
  def buscar_estadoid 
    nombre = params[:estado]
    @estados = Estados.new
    valor = @Estados.buscar_ciudad(nombre)
    if (valor==1)
       parsed_json = ActiveSupport::JSON.decode($tirajson)
       idciudad= parsed_json["id"]
       puts idciudad
    end
    render :text => $tirajson
  end
end
