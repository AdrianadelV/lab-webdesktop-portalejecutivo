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
end