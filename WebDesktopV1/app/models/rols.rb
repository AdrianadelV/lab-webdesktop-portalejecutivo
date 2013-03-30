class Rols < ActiveRecord::Base
  #Ma.Ale
  def buscarRols(rolid)
    @rols =  Rols.find(:first, :conditions => "id='#{rolid}'")
    if @rols!=nil
      $tira_roljson = @rols.to_json
      valor = 1
    else
      $tira_roljson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    puts 'tira rol '+$tira_roljson
    # return @rols
    return valor
  end
end