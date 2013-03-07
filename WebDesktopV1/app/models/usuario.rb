class Usuario < ActiveRecord::Base
  def autenticarUsuario(id_usuario,password)
    puts id_usuario
     @usuario = Usuario.find(:first, :conditions => "id_usuario='#{id_usuario}' and password='#{password}'")
    if @usuario!=nil
      $tirajson = @usuario.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return valor
  end
end