class Comprador_Vehiculo < ActiveRecord::Base
  
   def buscarUsuarioComprador(usuario_id)
    @comprador =  Comprador_Vehiculo.find(:first, :conditions => "usuarios_id='#{usuario_id}'")
    if @comprador!=nil
      $tirajson = @comprador.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return valor
  end
end