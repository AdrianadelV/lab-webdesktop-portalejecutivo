class RegistrarusuarioController < ApplicationController
  def index
  end
  
  #lo nuevo
  
  def grabar_comprador
    @comprador_vehiculo=Comprador_Vehiculo.new
    puts '+++++++++++++++++++++++++++++++++++++++++++++++++++++++controler'
 
 
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
    grabar_usuario(@nusuario, @password);
    
    
    puts '+++++++++++++++++++++++++++++++++++++++++++++++++++++++metio usuario'
    
  
    @comprador_vehiculo.grabar_comprador(@cedula,@nombres,@apellidos,@telefono,@direccion,@correo,@fecha_nacimiento,@sexo,@nusuario)
    render :text => $tirajson
  end
  
  #def buscar_comprador
  #  @cv=Comprador_Vehiculo.new
 #  nombres = params[:nombres]
  # valor = @marca.busca_comprador_existe(nombre)
   #render :text => $tirajson
  #end
  
  #la parte del usuario
  def grabar_usuario(nusuario, password)
    @usuario=Usuario.new
    @nombre=nusuario
    @password=password
    render :text => $tirajson
     puts '+++++++++++++++++++++++++++++llama el guardar del modelo usuario'
    return @usuario.grabar_usuario(@nombre,@password)
  end
  
  
end
