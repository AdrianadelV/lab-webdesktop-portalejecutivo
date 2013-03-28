class Modelo_Vehiculo < ActiveRecord::Base
  def buscarModelosMarca(id_marca)
    valor = 0
    @objmarcas = Modelo_Vehiculo.find(:all, :conditions => "marcas_id='#{id_marca}'")
    if @objmarcas!=nil
      $tirajson = @objmarcas.to_json
      parsed_json = ActiveSupport::JSON.decode($tirajson)
      i=0
      @objmarcas.each do |marca|
         parsed_json[i]["ano_m"]="2011"
         puts parsed_json.to_json
         i=i+1
      end
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Marca no existe!" }'
      valor = 0
    end
    return valor
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