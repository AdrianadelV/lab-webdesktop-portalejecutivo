class Vehiculos < ActiveRecord::Base
     #Ma.Ale
   def buscarvehiculo(detalle_vehiculos_id)
    @vehiculos =  Vehiculos.find(:first, :conditions => "id='#{detalle_vehiculos_id}'")
    if @vehiculos!=nil
      $tirajson = @vehiculos.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return @vehiculos
  end
end