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
     puts @usuario
    if @usuario!=nil
      $tirajson = @usuario.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return valor
  end
  
  #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto 
  def grabar_usuario_concesionario(nombre,password)
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre}'")
    if @usuario!=nil
       $tirajson = '{ "success": "true", "exito": "true", "message": "Ya existe ese nombre de usuario!" }'
    else
      @usuario= Usuario.new
      @usuario.nombre=nombre
      @usuario.password=password
      @usuario.rols_id= 2
      @usuario.estatus='a'
      @usuario.save
    end
     valor=1
     $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
  end
   #Adriana Santana -->Sino quieren ver una trigra con tigritos recien nacidos por favor no borren esto 
  def grabar_usuario_ensambladora(nombre,password)
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre}'")
    if @usuario!=nil
       $tirajson = '{ "success": "true", "exito": "true", "message": "Ya existe ese nombre de usuario!" }'
    else
      @usuario= Usuario.new
      @usuario.nombre=nombre
      @usuario.password=password
      @usuario.rols_id= 3
      @usuario.estatus='a'
      @usuario.save
    end
     valor=1
     $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
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
  
  #metodo de jose
  def grabar_usuario1(nombre,password,imagen)
   
    @usuario= Usuario.new
    @usuario.nombre=nombre
    @usuario.password=password
    @usuario.rols_id= 1
    @usuario.imagen=imagen
    @usuario.estatus='a'
    
    @usuario.save
     valor=1
    $tirajson = '{ "success": "true", "exito": "true", "message": "Datos de usuario guardados satisfactoriamente!" }'
    puts' graba tira de js usuario------------------------------------'
  
  end
end