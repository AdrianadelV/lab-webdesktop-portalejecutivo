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
    rol_usu= params[:rol_usu]
    nombre= params[:nombre]
    @usuario_indi = Usuarios_indicadors.all
    @son = Usuarios_indicadors.count
    @i=1
    @tira_indicadoresjson = '{ "datos": [ '
    @usuario_indi.each do |usuario_indicador|
      @indicadors = Indicadors.new
      indicador = @indicadors.buscarIndicadors(@usuario_indi[@i-1].indicadors_id)
      parsed_indijson = ActiveSupport::JSON.decode($tira_indjson)
      
      @usuarios = Usuario.new
      usuario = @usuarios.buscarUsuarioindcadorrol(@usuario_indi[@i-1].usuarios_id, rol_usu, nombre)
      parsed_usuajson = ActiveSupport::JSON.decode($tira_usuajson)
      
      @usuario_indicador = Usuarios_indicadors.new
      usuario_indicadors = @usuario_indicador.buscarUsuarioIndicadorrol(parsed_usuajson["id"],parsed_indijson["id"])
      parsed_usuarioindica = ActiveSupport::JSON.decode($tira_usuarioindicadorjson)
        
      @estados_indi = Estados_Indicadors.new
      estado_indi = @estados_indi.buscarEstadoIndi(@usuario_indi[@i-1].estados_indicadors_id)
      if @i<@son
        @tira_indicadoresjson = @tira_indicadoresjson        + ' { "nombre_indic": "'       + parsed_indijson["nombre"].to_s +
                                                               '", "id_indicador": "'       + parsed_usuarioindica["indicadors_id"].to_s + '"}, '
      else
        @tira_indicadoresjson = @tira_indicadoresjson        +' { "nombre_indic": "'        + parsed_indijson["nombre"].to_s +
                                                               '", "id_indicador": "'       + parsed_usuarioindica["indicadors_id"].to_s + '"} '
      end
      @i=@i+1
    end
    @tira_indicadoresjson = @tira_indicadoresjson + ' ] }'
     puts 'tirA INDICADORES +++++++++++++++'+ @tira_indicadoresjson
    render :text => @tira_indicadoresjson
  end
    
  def generarDataUsuarioIndicador
    @idindicador = params[:idindicador]
    @usua_indi = Usuarios_indicadors.new
    @usua_indi.buscarUsuarioIndicador(@idindicador)
    puts 'tira.........'+$tira_usuariojson
    render :text => $tira_usuariojson
  end
  
    def buscarResponsable
    @responsable = params[:responsable]
    @objresponsable = Responsables.new
    @objresponsable.buscar_responsable(@responsable)
    render :text => $tirajson
  end
end
