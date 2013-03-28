class Proformas < ActiveRecord::Base
    #Ma.Ale
  def buscarprofroma(sol_proformas_id)
    @proformas =  Proformas.find(:first, :conditions => "id='#{sol_proformas_id}'")
    if @proformas!=nil
      $tirajson = @proformas.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return @proformas
  end
  
end