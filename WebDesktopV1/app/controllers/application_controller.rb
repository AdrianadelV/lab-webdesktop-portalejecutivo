class ApplicationController < ActionController::Base
  protect_from_forgery
  def cerrarSession
    session[:nombre_login]=nil
    redirect_to '/inicio'
  end
end
