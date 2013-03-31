class Indicadors < ActiveRecord::Base
  #Ma.Ale
  def buscarIndicadors(usuario_indica_id)
    @indi =  Indicadors.find(:first, :conditions => "id='#{usuario_indica_id}'")
    if @indi!=nil
      $tira_indjson = @indi.to_json
      valor = 1
    else
      $tira_indjson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    puts 'tira rol '+$tira_indjson
    # return @rols
    return valor
  end
end