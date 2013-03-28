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
end
