class Concesionario_vehiculos < ActiveRecord::Base
  #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto
  def grabar_concesionario(rif,nombre,correo,telefono,ciudad,direccion,marca,nombre_usuario)
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre_usuario}'")
    if @usuario!=nil
      puts "**********************************************************************modelo"
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
      puts "********************* FIN"
  end
end
