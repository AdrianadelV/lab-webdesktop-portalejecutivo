class RegistrarusuarioController < ApplicationController
  def index
  end
  
  #lo nuevo
  #de jose
  def grabar_comprador
    @comprador_vehiculo=Comprador_Vehiculo.new
  
 
 
    @cedula=params[:cedula]
    @nombres=params[:nombres]
    @apellidos=params[:apellidos]
    @telefono=params[:telefono]
    @direccion=params[:direccion]
    @correo=params[:correo]
    @fecha_nacimiento=params[:fecha_nacimiento]
    @sexo=params[:sexo]
    #------
    @nusuario=params[:nusuario]
    @password=params[:password]
    puts ''+ @nusuario +  ''
     @imagen=params[:imagen]
     
    if  buscar_u(params[:nusuario]) 
     
       # $tirajson = '{ "success": "false", "exito": "false", "msg": " el nombre de usuario ya existe" }'
    else
      grabar_usuario(@nusuario, @password,@imagen);
     
      @comprador_vehiculo.grabar_comprador1(@cedula,@nombres,@apellidos,@telefono,@direccion,@correo,@fecha_nacimiento,@sexo,@nusuario)
      render :text => $tirajson
      valor = 0 
    end
    
     
    
    
  end
  
#de jose
  def grabar_usuario(nusuario, password,imagen)
    @usuario=Usuario.new
    @nombre=nusuario
    @password=password
    @imagen=imagen
   # render :text => $tirajson
     
    @usuario.grabar_usuario1(@nombre,@password,@imagen)
  end
  
  #de jose
  
  
  def buscar_u(nombre)
    puts ''+ nombre+  ''
    resp = false
   
    @usuario=Usuario.new
    @usuario = Usuario.find(:first, :conditions => "nombre='#{nombre}'")
     if @usuario !=nil
     resp = true
     else
       resp = false
     end
   return resp
  end
end
