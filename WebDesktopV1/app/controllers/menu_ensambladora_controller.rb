class MenuEnsambladoraController < ApplicationController
  def index
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:rols_id]==1)
      redirect_to '/cli_comprador'
    elsif(session[:rols_id]==2)
      redirect_to '/concesionario'
    elsif(session[:rols_id]==4)
      redirect_to '/menu_admin'
    end
  end

  def generar_menu
    @tipo=params[:tipo]
    @arbols = Arbols.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
  #Adriana Santana 
  def grabarModeloVehiculo
    @descripcion = params[:descripcion]
    @ano = params[:ano]
    @marca = params[:marca]
    @tipo = params[:tipo]
    @imagen1 = params[:imagen1]
    @imagen2 = params[:imagen]
    @modelo = Modelo_Vehiculo.new
    @modelo.guardarModeloVehiculo(@descripcion,@ano,@marca,@tipo,@imagen1,@imagen2)
    render :text => $tirajson
  end
  #Adriana Santana
  def buscar_usuario
    @nombre = params[:nombre]
    @ensambladora = Ensambladora_vehiculos.new
    @ensambladora.buscar_usuario(@nombre)
    render :text => $tirajson
    puts $tirajson
  end
  #Adriana Santana
  def buscar_ensambladora_marca
    @usuarios_id = params[:usuarios_id]
    @ensambladora = Ensambladora_vehiculos.new
    @ensambladora.buscar_ensambladora_marca(@usuarios_id)
    render :text => $tirajson
    puts $tirajson
  end
end
