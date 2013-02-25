class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def autenticar_usuario
     redirect_to :controller => :inicio
  end
end
