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
  end
  #Adriana Santana
  def buscar_ensambladora_marca
    @usuarios_id = params[:usuarios_id]
    @ensambladora = Ensambladora_vehiculos.new
    @ensambladora.buscar_ensambladora_marca(@usuarios_id)
    render :text => $tirajson
  end
 #Ma.Ale
  def buscar_indicador
    rolid= params[:rol_usu]
    @indicadors = Indicadors.all
    @son = Indicadors.count
    @i=1
    @tira_indicadoresjson = '{ "datos": [ '
    @indicadors.each do |indicador|
      @usuario_indi = Usuarios_indicadors.new
      usuario_indic = @usuario_indi.buscarUsuarioIndicador(@indicadors[@i-1].id)
      parsed_usuario_indijson = ActiveSupport::JSON.decode($tira_usuariojson)
      @usuarios = Usuario.new
      usuario = @usuarios.buscarUsuario(parsed_usuario_indijson["usuarios_id"])
      parsed_usuajson = ActiveSupport::JSON.decode($tira_usuajson)
      @estados_indi = Estados_Indicadors.new
      estado_indi = @estados_indi.buscarEstadoIndi(parsed_usuario_indijson["estados_indicadors_id"])
      @rol = Rols.new
      rols = @rol.buscarRols(rolid)
      parsed_roljson = ActiveSupport::JSON.decode($tira_roljson)     
      if @i<@son
        @tira_indicadoresjson = @tira_indicadoresjson        + ' { "nombre_indic": "'       + @indicadors[@i-1].nombre +
                                '", "id_indicador": "'       + @indicadors[@i-1].id.to_s + '"}, '
      else
        @tira_indicadoresjson = @tira_indicadoresjson        + ' { "nombre_indic": "'       + @indicadors[@i-1].nombre +
                                '", "id_indicador": "'       + @indicadors[@i-1].id.to_s + '"} '
      end
      @i=@i+1
    end
    @tira_indicadoresjson = @tira_indicadoresjson + ' ] }'
    render :text => @tira_indicadoresjson
    end
    
  def generarDataUsuarioIndicador
    @idindicador = params[:idindicador]
    @usua_indi = Usuarios_indicadors.new
    @usua_indi.buscarUsuarioIndicador(@idindicador)
    render :text => $tira_usuariojson
  end
end
