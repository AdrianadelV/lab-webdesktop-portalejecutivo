class Ensambladora_vehiculos < ActiveRecord::Base
  #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto
  def grabar_ensambladora(rif,nombre,correo,telefono,ciudad,direccion,marca,nombre_usuario)
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre_usuario}'")
    if @usuario!=nil
      @ensambladora=Ensambladora_vehiculos.new
      @ensambladora.rif=rif
      @ensambladora.nombre=nombre
      @ensambladora.correo=correo
      @ensambladora.telefono=telefono
      @ensambladora.ciudads_id=ciudad
      @ensambladora.direccion=direccion
      @ensambladora.marcas_id=marca
      @ensambladora.usuarios_id=@usuario.id
      @ensambladora.save
      valor=1
      $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no se registro el comprador" }'
    end
  end
  #Adriana Santana
  def buscar_usuario(nombre)
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre}'")
    if @usuario!=nil
      $tirajson = @usuario.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
      #puts 'usuario lo'+$tirajson
    end 
  end
  #Adriana Santana
  def buscar_ensambladora_marca(usuarios_id)
    @ensambladora = Ensambladora_vehiculos.find(:first, :conditions => "usuarios_id='#{usuarios_id}'")
    if @ensambladora!=nil
      $tirajson = @ensambladora.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
  end
  #Este metodo busca el id de la ensambladora dado el id de la marca
  def buscarId_Ensambladora_Marca(marcas_id)
    @ensambladora = Ensambladora_vehiculos.find(:first, :conditions => "marcas_id='#{marcas_id}'")
    if @ensambladora!=nil
      $tirajson = @ensambladora.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end
    return @ensambladora
  end
  #Ma.Ale
  def generardatalistaEnsambladora()
   @objEnsambladora = Ensambladora_vehiculos.all
   @son = Ensambladora_vehiculos.count
   if @son > 0 
    @i=1
    tirajson = '{ "datos": [ '
    @objEnsambladora.each do |ensambladora|
     if @i<@son
      tirajson = tirajson +   ' { "id_ensam": "'           + ensambladora.id.to_s +
                              '", "rif_ensam": "'          + ensambladora.rif + 
                              '", "nombre_ensam": "'       + ensambladora.nombre +
                              '", "direccion_ensam": "'    + ensambladora.direccion +
                              '", "telefono_ensam": "'     + ensambladora.telefono + 
                              '", "correo_ensam": "'       + ensambladora.correo +
                              '", "ciudads_id_ensam": "'   + ensambladora.ciudads_id.to_s +
                              '", "usuarios_id_ensam": "'  + ensambladora.usuarios_id.to_s +
                              '", "marcas_id_ensam": "'    + ensambladora.marcas_id.to_s + '"},'                              
     else
      tirajson = tirajson +   ' { "id_ensam": "'           + ensambladora.id.to_s +
                              '", "rif_ensam": "'          + ensambladora.rif + 
                              '", "nombre_ensam": "'       + ensambladora.nombre +
                              '", "direccion_ensam": "'    + ensambladora.direccion +
                              '", "telefono_ensam": "'     + ensambladora.telefono + 
                              '", "correo_ensam": "'       + ensambladora.correo +
                              '", "ciudads_id_ensam": "'   + ensambladora.ciudads_id.to_s +
                              '", "usuarios_id_ensam": "'  + ensambladora.usuarios_id.to_s +
                              '", "marcas_id_ensam": "'    + ensambladora.marcas_id.to_s + '"}'      
     end
     @i=@i+1
    end
    tirajson = tirajson + ' ] }'
   else
    tirajson = '{ "success": "true", "exito": "false", "msg": "No hay datos!" }'; 
   end
   return tirajson 
  end
end