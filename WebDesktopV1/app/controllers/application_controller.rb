class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter  :verify_authenticity_token
  def cerrarSession
    session[:nombre]=nil
    redirect_to '/inicio'
  end
end
