class ConcesionarioController < ApplicationController
  def index
    if(session[:nombre]==nil)
      redirect_to '/inicio'
    elsif(session[:rols_id]==1)
      redirect_to '/cli_comprador'
    elsif(session[:rols_id]==3)
      redirect_to '/menu_ensambladora'
    elsif(session[:rols_id]==4)
      redirect_to '/menu_admin'
    end
  end

  def generarmenu
    @tipo=params[:tipo]
    @arbols = Arbols.new
    @tira = @arbols.BuscarTodosArbolJson(@tipo)
    render :text => @tira
  end
  #Adriana Santana
  def generardatacombosindicadores
    @indicadores = Indicadors.all
    @tirajson = @indicadores.to_json
    render :text => @tirajson 
  end
  def generardatacombosunidades
    @unidades = Unidads.all
    @tirajson = @unidades.to_json
    render :text => @tirajson 
  end
  def generardatacombosestadosindicador
    @estadosindi = Estados_Indicadors.all
    @tirajson = @estadosindi.to_json
    render :text => @tirajson 
  end
  def generardatacombosfrecuencia
    @frecuencia = Frecuencia_Notificacions.all
    @tirajson = @frecuencia.to_json
    render :text => @tirajson
  end
  #metodo utilizado para buscar el usuario en la vista de indicadores
  def buscarUsuarioIndi
    @nombre=params[:nombre]
    @ensambladora = Ensambladora_vehiculos.new
    @ensambladora.buscar_usuario(@nombre)
    render :text => $tirajson
    puts $tirajson
  end
  
  def guardarConfiguracionIndicador
    @indicador= Usuarios_Indicadors.new
    @usuarios_id = params[:usuarios_id]
    @indicadors_id = params[:indicadors_id]
    @valor_meta = params[:valor_meta]
    @unidads_id = params[:unidads_id]
    @fecha_meta = params[:fecha_meta]
    @valor_amarillo = params[:valor_amarillo]
    @valor_rojo = params[:valor_rojo] 
    @valor_verde = params[:valor_verde]  
    @fecha_amarillo = params[:fecha_amarillo] 
    @fecha_rojo = params[:fecha_rojo] 
    @fecha_verde = params[:fecha_verde] 
    @estados_indicadors_id = params[:estados_indicadors_id] 
    @responsable = params[:responsable]  
    @correo_responsable = params[:correo_responsable] 
    @telefono = params[:telefono] 
    @frecuencia_notificacions_id = params[:frecuencia_notificacions_id] 
    @indicador.grabarIndicador(@usuarios_id,@indicadors_id,@valor_meta,@unidads_id,@fecha_meta,@valor_amarillo,@valor_rojo,@valor_verde,@fecha_amarillo,@fecha_rojo,@fecha_verde,@estados_indicadors_id,@responsable,
                               @correo_responsable,@telefono,@frecuencia_notificacions_id)
    render :text => $tirajson
  end
end
