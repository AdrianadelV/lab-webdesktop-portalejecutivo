class ClienteResfulController < ApplicationController
  require'nestful'
  def index

  end
  def call_service
    #ojo la ip hay que cambiarsela por la ip donde estan los servicios para que pueda funcionar
      $tirajson= Nestful.get 'http://localhost/eai/servidor-restful/Despachador.php?servicio=4',:format => :json #=> "body" #:format => :json #=> {:json_hash => 1}
      render :text => $tirajson.to_json 
    #  puts $tirajson
      return $tirajson   
  end
  def call_service2_precio_vehiculo
    #este servicio se va a traer el precio de los vehiculos desde indepabis que estan regulados
    #ojo la ip hay que cambiarsela por la ip donde estan los servicios para que pueda funcionar
     @id_modelo=params[:id_modelo]
      $tirajson= Nestful.get 'http://localhost/eai/servidor-restful/Despachador.php?servicio=21&id_modelo='+@id_modelo,:format => :json #=> "body" #:format => :json #=> {:json_hash => 1}
      render :text => $tirajson.to_json
    #  puts $tirajson
    #  puts'******************* despues de la tira Json'
      return $tirajson   
  end
end