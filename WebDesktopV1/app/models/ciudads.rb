class Ciudads < ActiveRecord::Base

    #Ma.Ale
    def buscarnombreciudad(idciudad)
    @ciudads =  Ciudads.find(:first, :conditions => "id='#{idciudad}'")
    if @ciudads!=nil
      $tirajson = @ciudads.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    #puts $tirajson
    return valor
  end 
end