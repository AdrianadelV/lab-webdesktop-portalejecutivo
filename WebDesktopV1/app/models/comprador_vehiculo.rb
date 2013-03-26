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

  #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto 
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
  #lo nuevo
  def grabar_comprador1(cedula,nombres,apellidos,telefono,direccion,correo,fecha_nacimiento,sexo,nusuario)
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nusuario}'")
    if @usuario!=nil
      
 
     puts "**********************************************************************modelo"
    @comprador_vehiculo=Comprador_Vehiculo.new
    @comprador_vehiculo.cedula=cedula
    @comprador_vehiculo.nombres=nombres
    @comprador_vehiculo.apellidos=apellidos
    @comprador_vehiculo.telefono=telefono
    @comprador_vehiculo.direccion=direccion
    @comprador_vehiculo.correo=correo
    @comprador_vehiculo.fecha_nacimiento=fecha_nacimiento
    @comprador_vehiculo.sexo=sexo
    @comprador_vehiculo.usuarios_id=@usuario.id
    @comprador_vehiculo.save
    valor=1
    $tirajson = '{ "success": "true", "exito": "true", "message": "Datos de comprador guardados satisfactoriamente!" }'
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no se registro el comprador" }'
    end
     puts "********************* FIN"
  end
  
 

end