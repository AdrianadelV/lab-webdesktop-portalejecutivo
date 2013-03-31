class Modelo_Vehiculo < ActiveRecord::Base
  #Adriana Santana busca un modelo de una marca en especifico
  def buscarModelosMarca(id_marca)
    valor = 0
    @objmodelos = Modelo_Vehiculo.find(:all, :conditions => "marcas_id='#{id_marca}'")
    if @objmodelos!=nil
      $tirajson = @objmodelos.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Marca no existe!" }'
      valor = 0
    end
    return @objmodelos
  end
  def creararchivofisico(name,directory,contenido)
   # creando la ruta
   path = File.join(directory,name)
   #grabando el archivo
   File.open(path, "wb") {|f1| f1.write(contenido) }
  end
  #Adriana Santana
  def guardarModeloVehiculo(descripcion,ano,marca,tipo,imagen1,imagen2)
    @modelo=Modelo_Vehiculo.new
    @modelo.descripcion=descripcion
    @modelo.ano_m=ano
    @modelo.marcas_id=marca
    @modelo.tipo_vehiculos_id=tipo
    @modelo.imagen1=imagen1
    @modelo.imagen2=imagen2
    @modelo.save
    valor=1
    $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
  end
  #Adriana Santana
  def buscarModelos(id)
    @modelo = Modelo_Vehiculo.find(:first, :conditions => "id='#{id}'")
    if @modelo!=nil
      $tirajson = @modelo.to_json
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Modelo no Encontrado!" }'
    end
    return @modelo
  end
    #Ma.Ale
   def buscarmodelovehiculos(vehic_modelo_vehiculos_id)
    @modelo =  Modelo_Vehiculo.find(:first, :conditions => "id='#{vehic_modelo_vehiculos_id}'")
    if @modelo!=nil
      $tirajson = @modelo.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return @modelo
  end
end