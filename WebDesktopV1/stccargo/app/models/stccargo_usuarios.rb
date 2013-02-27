class Stccargo_usuarios < ActiveRecord::Base
  
  def buscar(usuario,clave)
   valor = 0
    @objusuario = Stccargo_usuarios.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objusuario!=nil
      valor = 1
    else
      valor = 0
    end 
   return valor
  end
  
  def validarSesion(user,clave)
   @usuario = Stccargo_usuarios.new
   @valor=@usuario.buscar(user,clave)
   return @valor
  end
  
  def cargar(usuario,clave)
   valor = 0
    @objusuario = Stccargo_usuarios.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objusuario!=nil
      $tirajson = '{"success": "true", "usuario": "'+@objusuario.usuario+'", "clave": "'+@objusuario.clave+'", "nivel": "'+@objusuario.nivel+'", "nombre": "'+@objusuario.nombre+'", "correo": "'+@objusuario.correo+'", "twitter": "'+@objusuario.twitter+'", "celular": "'+@objusuario.celular+'", "direccion": "'+@objusuario.direccion+'", "telefono": "'+@objusuario.telefono+'"  }'
      valor = 1
    else
      $tirajson = '{ "success": "false" }'
      valor = 0
    end 
   return valor
  end
  
  def grabar(usuario,clave,datos)
   valor = 0
    @objusuario = Stccargo_usuarios.find(:first, :conditions => "usuario='#{usuario}' and clave='#{clave}'" )
    if @objusuario!=nil
      @objusuario.nombre = datos[0].to_s
      @objusuario.correo = datos[1].to_s
      @objusuario.twitter = datos[2].to_s
      @objusuario.celular = datos[3].to_s
      @objusuario.direccion = datos[4].to_s
      @objusuario.telefono = datos[5].to_s
      if (datos[6].to_s==datos[7].to_s and datos[6].to_s!="")
       @objusuario.clave = datos[6].to_s
       $clave_stccargo = datos[6].to_s
      end
      @objusuario.save
      $tirajson = '{ "success": "true", "msg": "Datos guardados satisfactoriamente!" }'
      valor = 1
    else
      $tirajson = '{ "success": "true", "msg": "Datos NO guardados!" }'
      valor = 0
    end 
   return valor
  end
  
end