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
  def grabarComprador(cedula,nombres,apellidos,telefono,direccion,correo,fecha_nacimiento,sexo)
    puts "pasehola"
    @comprador =  Comprador_Vehiculo.find(:first, :conditions => "cedula='#{cedula}'")
    if @comprador!=nil
       @comprador.cedula=cedula
       @comprador.nombres=nombres
       @comprador.apellidos=apellidos
       @comprador.telefono=telefono
       @comprador.direccion=direccion
       @comprador.correo=correo
       @comprador.fecha_nacimiento=fecha_nacimiento
       @comprador.sexo=sexo
       @comprador.save
    end
    valor=1
    $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'

  end
end