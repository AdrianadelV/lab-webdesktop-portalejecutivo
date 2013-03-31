class Estados < ActiveRecord::Base
  
  def buscarnombreEstado(id_estado)
    @estados =  Estados.find(:first, :conditions => "id='#{id_estado}'")
    if @estados!=nil
      $tirajson = @estados.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    #puts $tirajson
    return valor
  end
end