class Usuarios_indicadors < ActiveRecord::Base
  # Ma.Ale
  def buscarUsuarioIndi(indicador_id)
    @usuarios_indicadors =  Usuarios_indicadors.find(:first, :conditions => "indicadors_id='#{indicador_id}'")
    if @usuarios_indicadors!=nil
      $tira_usuariojson = @usuarios_indicadors.to_json
      valor = 1
    else
      $tira_usuariojson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    puts 'tira usu_ind '+$tira_usuariojson
    # return @usuarios_indicadors
    return valor
  end
end