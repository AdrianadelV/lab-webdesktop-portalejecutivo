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

  def generarcomboMarcas
    @marca = Marca.all
    $tira = @marca.to_json
    render :text => $tira
  end

  def generardatalistamarcas
    @marca = Marca.new
    $tirajson=@marca.generardatalistamarcas()
    render :text => $tirajson
  end
  #Adriana Santana
  def generardatacombostipos
    @tipo = Tipo_Vehiculos.all
    $tirajson = @tipo.to_json
    render :text => $tirajson
  end
  #Adriana Santana
  def generarcomboModelo
    @modelo = Modelo_Vehiculo.all
    $tirajson = @modelo.to_json
    render :text => $tirajson
  end

  def generardatalistaConcesionarios
    @concesionario = Concesionario_vehiculos.new
    $tirajson=@concesionario.generardatalistaConcesionarios()
    render :text => $tirajson
  end

  #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto
  def grabar_concesionario
    @concesionario = Concesionario_vehiculos.new
    @usuario = Usuario.new
    @rif=params[:rif]
    @nombre=params[:nombre]
    @correo=params[:correo]
    @telefono=params[:telefono]
    @ciudad=params[:ciudad]
    @direccion=params[:direccion]
    @marca=params[:marca]
    #------
    @nombre_usuario=params[:nombre_usuario]
    @contrasena=params[:contrasena]
    @usuario.grabar_usuario_concesionario(@nombre_usuario, @contrasena);
    @concesionario.grabar_concesionario(@rif,@nombre,@correo,@telefono,@ciudad,@direccion,@marca,@nombre_usuario)
    render :text => $tirajson
  end

  #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto
  def grabar_ensambladora
    @ensambladora = Ensambladora_vehiculos.new
    @usuario = Usuario.new
    @rif=params[:rif]
    @nombre=params[:nombre]
    @correo=params[:correo]
    @telefono=params[:telefono]
    @ciudad=params[:ciudad]
    @direccion=params[:direccion]
    @marca=params[:marca]
    #------
    @nombre_usuario=params[:nombre_usuario]
    @contrasena=params[:contrasena]
    @usuario.grabar_usuario_concesionario(@nombre_usuario, @contrasena);
    @ensambladora.grabar_ensambladora(@rif,@nombre,@correo,@telefono,@ciudad,@direccion,@marca,@nombre_usuario)
    render :text => $tirajson
  end
end
