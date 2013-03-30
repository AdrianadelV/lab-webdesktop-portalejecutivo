class Modelo_Caracteristicas < ActiveRecord::Base
  #Adriana Santana
  def guardar_caracteristica(modelo_vehiculos_id,caracteristicas_id,id_ensambladora)
    @caracteristicas = Modelo_Caracteristicas.new
    @caracteristicas.modelo_vehiculos_id=modelo_vehiculos_id
    @caracteristicas.caracteristicas_id=caracteristicas_id
    @caracteristicas.ensambladora_vehiculos_id=id_ensambladora
    @caracteristicas.save
    valor=1
    $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
    return @caracteristicas
  end
  #Adriana Santana
  def buscarCaracteristicas(modelo_id)
    @caracteristicas = Modelo_Caracteristicas.find(:all, :conditions => "modelo_vehiculos_id='#{modelo_id}'")
    puts @caracteristicas
    if @caracteristicas!=nil
      $tirajson = @caracteristicas.to_json
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Modelo no Encontrado!" }'
    end
    puts $tirajson
    return @caracteristicas
  end
end