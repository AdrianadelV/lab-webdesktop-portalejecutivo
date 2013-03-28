class ClienteResfulController < ApplicationController
  require'nestful'
  def index

  end
  def call_service
    #ojo la ip hay que cambiarsela por la ip donde estan los servicios para que pueda funcionar
      $tirajson= Nestful.get 'http://localhost/eai/servidor-restful/Despachador.php?servicio=4',:format => :json #=> "body" #:format => :json #=> {:json_hash => 1}
      render :text => $tirajson.to_json 
      puts $tirajson
      return $tirajson   
  end
end