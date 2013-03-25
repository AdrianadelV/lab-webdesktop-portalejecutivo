class Ensambladora_vehiculos < ActiveRecord::Base
  #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto
  def grabar_ensambladora(rif,nombre,correo,telefono,ciudad,direccion,marca,nombre_usuario)
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre_usuario}'")
    if @usuario!=nil
      puts "**********************************************************************modelo"
      @ensambladora=Ensambladora_vehiculos.new
      @ensambladora.rif=rif
      @ensambladora.nombre=nombre
      @ensambladora.correo=correo
      @ensambladora.telefono=telefono
      @ensambladora.ciudads_id=ciudad
      @ensambladora.direccion=direccion
      #AQUI DEBE IR ES MARCA SOLO SE ESTA PROBANDO SI EL METODO FUNCIONA CORRECTAMENTE
      @ensambladora.marcas_id=ciudad
      @ensambladora.usuarios_id=@usuario.id
      @ensambladora.save
      valor=1
      $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no se registro el comprador" }'
    end
      puts "********************* FIN"
  end
end