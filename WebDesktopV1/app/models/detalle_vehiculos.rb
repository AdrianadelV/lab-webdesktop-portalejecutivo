class Detalle_vehiculos < ActiveRecord::Base
   #Ma.Ale 
   def buscardetalle_vehiculo(pro_detalle_vehiculos_id)
    @detalle_vehiculos =  Detalle_vehiculos.find(:first, :conditions => "id='#{pro_detalle_vehiculos_id}'")
    if @detalle_vehiculos!=nil
      $tirajson = @detalle_vehiculos.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return @detalle_vehiculos
  end
end