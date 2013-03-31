class Proformas < ActiveRecord::Base
    #Ma.Ale
  def buscarprofroma(sol_proformas_id)
    @proformas =  Proformas.find(:first, :conditions => "id='#{sol_proformas_id}'")
    if @proformas!=nil
      $tirajson = @proformas.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    return @proformas
  end
  def graba_proforma(fecha,validez,estatus,banco,comprador_vehiculo_id,concesionario,detalle_vehiculo_id)
    @proforma=Proformas.new
    @proforma.fecha=fecha
    @proforma.validez=validez
    @proforma.estatus=estatus
    @proforma.bancos_id=banco
    @proforma.comprador_vehiculos_id=comprador_vehiculo_id
    @proforma.concesionario_vehiculos_id=concesionario
    @proforma.detalle_vehiculos_id=detalle_vehiculo_id
    @proforma.save  
  end
end