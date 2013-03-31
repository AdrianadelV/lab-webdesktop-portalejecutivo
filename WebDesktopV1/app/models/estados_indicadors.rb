class Estados_Indicadors < ActiveRecord::Base
  #Ma.Ale
  def buscarEstadoIndi(usuario_indica_id)
    @estados_Indicadors =  Estados_Indicadors.find(:first, :conditions => "id_estado='#{1}'")
    if @estados_Indicadors!=nil
      $tirajson = @usuarios.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
   # puts 'tira estado '+$tirajson
    return @estados_Indicadors
  end
end