class Usuario < ActiveRecord::Base
  def autenticarUsuario(nombre,password)
     @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre}' and password='#{password}'")
    if @usuario!=nil
      $tirajson = @usuario.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return valor
  end
  def buscarUsuarioLo(nombre)
     @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre}'")
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