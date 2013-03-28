class Concesionario_vehiculos < ActiveRecord::Base
  #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto
  def grabar_concesionario(rif,nombre,correo,telefono,ciudad,direccion,marca,nombre_usuario)
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre_usuario}'")
    if @usuario!=nil
      @concesionario=Concesionario_vehiculos.new
      @concesionario.rif=rif
      @concesionario.nombre=nombre
      @concesionario.correo=correo
      @concesionario.telefono=telefono
      @concesionario.ciudads_id=ciudad
      @concesionario.direccion=direccion
      @concesionario.marcas_id=marca
      @concesionario.usuarios_id=@usuario.id
      @concesionario.save
      valor=1
      $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no se registro el comprador" }'
    end
  end
  
  def generardatalistaConcesionarios()
   @@objConcesionario_vehiculos = Concesionario_vehiculos.all
   @son = Concesionario_vehiculos.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @@objConcesionario_vehiculos.each do |concesionario|
     if @i<@son
      tirajson = tirajson +   ' { "id": "'        + concesionario.id.to_s +
                              '", "rif": "'        + concesionario.rif + 
                              '", "nombre": "'        + concesionario.nombre +
                              '", "direccion": "'       + concesionario.direccion +
                              '", "telefono": "'      + concesionario.telefono + 
                              '", "correo": "'       + concesionario.correo +
                              '", "latitud": "'       + concesionario.latitud +
                              '", "longitud": "'       + concesionario.longitud +
                              '", "ciudads_id": "'       + concesionario.ciudads_id.to_s +
                              '", "usuarios_id": "'       + concesionario.usuarios_id.to_s +
                              '", "marcas_id": "'       + concesionario.marcas_id.to_s + '"},'                              
     else
      tirajson = tirajson +   ' { "id": "'        + concesionario.id.to_s +
                              '", "rif": "'        + concesionario.rif + 
                              '", "nombre": "'        + concesionario.nombre +
                              '", "direccion": "'       + concesionario.direccion +
                              '", "telefono": "'      + concesionario.telefono + 
                              '", "correo": "'       + concesionario.correo +
                              '", "latitud": "'       + concesionario.latitud +
                              '", "longitud": "'       + concesionario.longitud +
                              '", "ciudads_id": "'       + concesionario.ciudads_id.to_s +
                              '", "usuarios_id": "'       + concesionario.usuarios_id.to_s +
                              '", "marcas_id": "'       + concesionario.marcas_id.to_s + '"}, '       
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ] }'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  end
  #Ma.Ale
  def buscarconcesionario(pro_concesionario_vehiculos_id)
    @concesionario_vehiculos =  Concesionario_vehiculos.find(:first, :conditions => "id='#{pro_concesionario_vehiculos_id}'")
    if @concesionario_vehiculos!=nil
      $tirajson = @concesionario_vehiculos.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return @concesionario_vehiculos
  end

end