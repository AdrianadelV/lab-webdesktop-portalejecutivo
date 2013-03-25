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
    valor = @marca.buscar(nombre)
    render :text => $tirajson
  end

  def generardatacombosestados
    @estados = Estados.all
    @tirajson = @estados.to_json
    render :text => @tirajson
  end

  def generardatacombosciudades
    @ciudads = Ciudads.all
    $tirajson = @ciudads.to_json
    render :text => $tirajson
  end

  def generardatalistamarcas
    @marca = Marca.new
    $tirajson=@marca.generardatalistamarcas()
    render :text => $tirajson
  end
end