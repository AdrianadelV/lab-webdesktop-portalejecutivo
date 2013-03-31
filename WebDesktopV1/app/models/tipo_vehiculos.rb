class Tipo_Vehiculos < ActiveRecord::Base
  #Ma.Ale
   def buscartipovehiculo(mode_tipovehi_id)
    @objtipo =  Tipo_Vehiculos.find(:first, :conditions => "id='#{mode_tipovehi_id}'")
    if @objtipo!=nil
      $tirajson = @objtipo.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
   # puts '----tira----'+$tirajson
    return @objtipo
  end  
end