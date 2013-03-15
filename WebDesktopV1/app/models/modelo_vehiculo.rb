class Modelo_Vehiculo < ActiveRecord::Base
  def buscarModelosMarca(id_marca)
    valor = 0
    @objmarcas = Modelo_Vehiculo.find(:all, :conditions => "marcas_id='#{id_marca}'")
    if @objmarcas!=nil
      $tirajson = @objmarcas.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Marca no existe!" }'
      valor = 0
    end
    return valor
  end
end