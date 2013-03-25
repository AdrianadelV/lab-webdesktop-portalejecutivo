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
  	def grabar_usuario(nombre,password)
    @usuario= Usuario.new
    @usuario.nombre=nombre
    @usuario.password=password
    @usuario.rol_id= 1
    @usuario.estatus='a'
    @usuario.save
     valor=1
    $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
    puts' graba tira de js usuario------------------------------------'
  end
   	def retornarid(nombre)
    puts' busca el usuairo por nombre --------------------------'+ nombre +'---a buscar---'
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre}'")
    @identidad=''
    puts' busca el ' + @usuario.id+''
    if @usuario!=nil
      usuario.id = @usuario.id

    else  identidad=''
    end
    return identidad
  end
  def modificarContrasena(nombre,canterior,cnueva)
    @objusuario = Usuario.find(:first, :conditions => "nombre='#{nombre}'")
    if @objusuario!=nil
      if @objusuario.password==canterior
        @objusuario.password=cnueva
        @objusuario.save
        $tirajson = '{ "success": "true", "exito": "true", "message": "Datos Actualizados" }'
      else
        $tirajson = '{ "success": "true", "exito": "true", "message": "Contrasena Anterior es incorrecta" }'
      end
    else
      $tirajson = '{ "success": "true", "exito": "false", "message": " no se encontro comprador" }'
    end
  end
end