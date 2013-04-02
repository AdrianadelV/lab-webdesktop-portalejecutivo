class Responsables < ActiveRecord::Base
    def buscar_responsable(id_responsable)
    @responsable = Responsables.find(:first, :conditions => "id_responsable='#{id_responsable}'")
    if @responsable!=nil
      $tirajson = @responsable.to_json
      valor = 1
    else
      $tirajson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
      puts '@responsable  '+$tirajson
    end 
  end
end