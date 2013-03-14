class ApplicationController < ActionController::Base
  protect_from_forgery
  def cerrarSession
    session[:nombre]=nil
    redirect_to '/inicio'
  end
end
