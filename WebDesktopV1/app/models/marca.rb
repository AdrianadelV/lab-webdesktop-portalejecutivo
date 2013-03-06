class Marca < ActiveRecord::Base
   def buscar(id_marca)
   valor = 0
    @objmarcas = Marca.find(:first, :conditions => "id_marca='#{id_marca}'")
    if @objmarcas!=nil
      $tirajson = '{"success": "true", 
                    "exito": "true",
                    "id_marca": "'+@objmarcas.id_marca.to_s()+'",
                    "nombre_marca": "'+@objmarcas.nombre+'",
                    "mision": "'+@objmarcas.mision+'",
                    "vision": "'+@objmarcas.vision+'",
                    "valores": "'+@objmarcas.valores+'",
                    "contacto": "'+@objmarcas.contacto+'",
                    "imagen": "'+@objmarcas.imagen+'"}'
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": "Marca no existe!" }'
      valor = 0
    end 
    return valor
  end
end