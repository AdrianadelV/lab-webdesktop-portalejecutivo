class Caracteristicas < ActiveRecord::Base
  def buscarValorCaracteristicasModelos(caract_id)
    @caracteristica = Caracteristicas.find(:all, :conditions => "id='#{caract_id}'")
    if @caracteristica!=nil
      $tirajson = @caracteristica.to_json
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Modelo no Encontrado!" }'
    end
    puts $tirajson
    return @caracteristica
  end
end