class Usuarios_indicadors < ActiveRecord::Base
  # Ma.Ale
  def buscarUsuarioIndicador(indicador_id)
    @usuarios_indicadors =  Usuarios_indicadors.find(:first, :conditions => "indicadors_id='#{indicador_id}'")
    if @usuarios_indicadors!=nil
      $tira_usuariojson = @usuarios_indicadors.to_json
      valor = 1
    else
      $tira_usuariojson = '{ "success": "true", "exito": "false", "msg": " no existe!" }'
      valor = 0
    end 
    puts 'tira usu_ind '+$tira_usuariojson
    # return @usuarios_indicadors
    return valor
  end
  #Adriana Santana
  def grabarIndicador(usuarios_id,indicadors_id,valor_meta,unidads_id,fecha_meta,valor_amarillo,valor_rojo,valor_verde,fecha_amarillo,fecha_rojo,fecha_verde,estados_indicadors_id,responsable,correo_responsable,telefono,frecuencia_notificacions_id)
    @usuario = Usuarios_indicadors.new
    @usuario.usuarios_id=usuarios_id
    @usuario.indicadors_id=indicadors_id
    @usuario.valor_meta=valor_meta
    @usuario.unidads_id=unidads_id
    @usuario.fecha_meta=fecha_meta
    @usuario.valor_amarillo=valor_amarillo
    @usuario.valor_rojo=valor_rojo
    @usuario.valor_verde=valor_verde
    @usuario.fecha_amarillo=fecha_amarillo
    @usuario.fecha_rojo=fecha_rojo
    @usuario.fecha_verde=fecha_verde
    @usuario.estados_indicadors_id=estados_indicadors_id
    @usuario.responsable=responsable
    @usuario.correo_responsable=correo_responsable
    @usuario.telefono=telefono
    @usuario.frecuencia_notificacions_id=frecuencia_notificacions_id
    @usuario.save
    valor=1
    $tirajson = '{ "success": "true", "exito": "true", "message": "Datos guardados satisfactoriamente!" }'
  end
end